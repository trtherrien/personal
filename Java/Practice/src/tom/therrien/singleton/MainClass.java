/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tom.therrien.singleton;

/**
 *
 * @author trtherrien
 */
public class MainClass {
    public static void main(String[] args) {
        SingletonClass sc = SingletonClass.INSTANCE;
        sc.testIt();
    }
}
