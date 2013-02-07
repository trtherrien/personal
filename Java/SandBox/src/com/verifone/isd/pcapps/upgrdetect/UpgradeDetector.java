package com.verifone.isd.pcapps.upgrdetect;

import java.io.*;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
//import com.verifone.isd.pcapps.autoup.notification.UpgradeNotificationMgr;

/**
 *
 * @author tom_t1
 */
public class UpgradeDetector implements Runnable{
    
    private final File updatePath = new File("C:\\v950\\update");
    private final File upgradePath = new File("C:\\v950\\upgrade");
    private final File packageFile = new File(updatePath.getPath() + "\\overlay.zip");
    private final File signatureFile = new File(updatePath.getPath() + "\\overlay.sig");
    private final File packageFileUpgrade = new File(upgradePath.getPath() + "\\overlay.zip");
    private final File signatureFileUpgrade = new File(upgradePath.getPath() + "\\overlay.sig");
    private final File breadCrumb = new File(upgradePath.getPath() + "\\inuse");
    private final int msBetweenWait = 5000;
    private boolean keepRunning = true;
    
    public static void main(String[] args) {
    
        try {
            Thread t = new Thread(new UpgradeDetector());
            t.start();
            t.join();
        } catch (Throwable t) {
            System.out.println(t.getMessage());
            System.exit(1);
        }
        System.exit(0);
    }   

    @Override
    public void run() {
        while (keepRunning) {
                
            try {
                
                //Make the update directory if it does not exist.
                if (!updatePath.exists()) {
                    updatePath.mkdirs();
                }

                /*
                 * If both the signature and zip file are found then
                 * we need to process. It is expected that the signature 
                 * file will be placed last to avoid complications.
                 */
                if (signatureFile.exists() && packageFile.exists()) {
                    
                    //Make the upgrade directory if it does not exist.
                    if (!upgradePath.exists()) {
                        upgradePath.mkdirs();
                    } else {
                        //Wipe out any previous data
                        removeFolder(upgradePath);
                        upgradePath.mkdirs();
                    }
                    
                    
                    //Create BreadCrumb
                    if (!breadCrumb.exists()) {
                        breadCrumb.createNewFile();
                    }
                    
                    if (signatureFileUpgrade.exists()) {
                        signatureFileUpgrade.delete();
                    }
                    signatureFile.renameTo(signatureFileUpgrade);
                    
                    if (packageFileUpgrade.exists()) {
                        packageFileUpgrade.delete();
                    }
                    packageFile.renameTo(packageFileUpgrade);
                    
                    unzipPackageFileUpgrade();
                    
                    //Call notifyUpgrade
                }
                
            } catch (Throwable t) {
                System.out.println(t.getMessage());
            } finally {
                if (breadCrumb.exists()) {
                    breadCrumb.delete();
                }
                waitABit();
            }
        }

    }
    
    //Created to avoid the warning about having thread.sleep in a loop.
    private void waitABit() {
        try {
            Thread.sleep(msBetweenWait);
        } catch (InterruptedException ie) {
            //Oh well, we are not waiting this time.
        }
    }
    
    private void removeFolder(File folder) {
        
        File[] fileList = folder.listFiles();
        
        for (int i = 0; i < fileList.length; i++) {
            if (fileList[i].isDirectory()) {
                removeFolder(fileList[i]);
            } else {
                fileList[i].delete();
            }
        }
        folder.delete();
    }
    
    private void unzipPackageFileUpgrade() {
        try {
            int BUFFER = 2048;
            ZipFile zipFile;
            // Open Zip file for reading
            zipFile = new ZipFile(packageFileUpgrade, ZipFile.OPEN_READ);
            Enumeration zipFileEntries = zipFile.entries();
            while (zipFileEntries.hasMoreElements()) {
                ZipEntry entry = (ZipEntry) zipFileEntries.nextElement();
                String entryName = entry.getName();
                if (entry.isDirectory()) {
                    File newFolder = new File(upgradePath.getPath() + "\\" + entryName);
                    if (!newFolder.exists()) {
                        newFolder.mkdirs();
                    }
                } else {
                    BufferedInputStream is = new BufferedInputStream(zipFile.getInputStream(entry));
                    BufferedOutputStream dest = null;
                    try {
                        
                        int currentByte;
                        // establish buffer for writing file
                        byte data[] = new byte[BUFFER];

                        // write the current file to disk
                        FileOutputStream fos = new FileOutputStream(new File(upgradePath.getPath() + "\\" + entryName));
                        dest = new BufferedOutputStream(fos, BUFFER);

                        // read and write until last byte is encountered
                        while ((currentByte = is.read(data, 0, BUFFER)) != -1) {
                            dest.write(data, 0, currentByte);
                        }
                    } catch (Exception e) {
                        
                    } finally {
                        if (dest != null) {
                            dest.flush();
                            dest.close();
                        }
                        is.close();
                    }
                    
                }
            }
        
        } catch (IOException ioe) {
            System.out.println ("IOException - " + ioe.getMessage());
        }
    }
    
    public void stop() {
        keepRunning = false;
    }
    
}
