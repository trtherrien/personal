
import java.io.BufferedReader;
import java.io.InputStreamReader;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author tom_t1
 */
public class GetMac {
    
    public static void main(String[] args) {
    
            System.out.println("[Utility] Get Mac");
            Process p;
            String mac = null;
            InputStreamReader inStreamReader = null;
            BufferedReader in = null;
            try {
                p = Runtime.getRuntime().exec("cmd /c getmac /fo csv /nh");
                inStreamReader = new  InputStreamReader(p.getInputStream());
                in = new BufferedReader(inStreamReader);
                //Read only the first line
                  
                char[] cbuf = new char[25];
                  
                in.read(cbuf);
                String line = new String (cbuf);
                String[] result = line.split(",");
                mac = result[0].replace('"', ' ').trim();
            } catch(Exception e){
                e.printStackTrace();
            } finally{
                try{
                    if(in != null){
                        in.close();
                    }
                    if(inStreamReader!=null){
                        inStreamReader.close();
                    }
                } catch(Exception e){
                           //RSDLogger.log_err("[Utility] Closing Stream Error: " + e);
                           e.printStackTrace();
                }
            }
              
            System.out.println(mac);
    }
}
