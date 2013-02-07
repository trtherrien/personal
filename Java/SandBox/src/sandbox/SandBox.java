package sandbox;

import java.util.TimeZone;

/**
 *
 * @author tom_t1
 */
public class SandBox {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        TimeZone tz = TimeZone.getDefault();
        int offset = (tz.getRawOffset());
        int myDST = (tz.getDSTSavings());
        
        System.out.println(offset);
        System.out.println(myDST);
        
        //int offset = ((60 * 60) * (-5) * 1000);
        
        TimeZone tz2 = TimeZone.getTimeZone("US/Eastern");
        if ((tz2.getRawOffset() == offset) && (tz2.getDSTSavings() == myDST)) {
            System.out.println("Found " + tz2.getID());
        }
        
        
    }
}
