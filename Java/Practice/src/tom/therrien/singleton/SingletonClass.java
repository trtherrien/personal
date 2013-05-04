/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tom.therrien.singleton;

/**
 *
 * @author trtherrien
 */
public enum SingletonClass {
    INSTANCE;
    
    private SingletonClass() {
    }
    
    public void testIt() {
        System.out.println("Testing");
    }
    
}
