/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Args;

/**
 *
 * @author tom_t1
 */
public class Args {
    
    
    public static void main(String[] args) {
        
        for (int i = 0; i < args.length; i ++) {
            if (args[i].length() < 2) {
                System.out.println("Unknown argument: " + args[i]);
            } else {
                if (args[i].toLowerCase().startsWith("-i")) {
                    System.out.println("infinite detected");
                } else if (args[i].toLowerCase().startsWith("-t")) {
                    System.out.println("Timeout value is: " + args[i].substring(3));
                } else {
                    System.out.println("Unknown argument: " + args[i]);
                }
            }
        }
        
    }
    
    
}
