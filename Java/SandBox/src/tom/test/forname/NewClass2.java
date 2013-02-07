/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tom.test.forname;

import java.lang.reflect.Constructor;

/**
 *
 * @author tom_t1
 */
public class NewClass2 {
    public static void main (String[] args) {
        try {
            
            Class classInstance = Class.forName("tom.test.forname.NewClass1");
            Constructor curConstructor = classInstance.getConstructor();
            NewClass notifyObject = (NewClass) curConstructor.newInstance();
            notifyObject.test();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
