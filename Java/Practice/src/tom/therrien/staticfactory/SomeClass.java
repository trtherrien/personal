/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tom.therrien.staticfactory;

/**
 *
 * @author trtherrien
 */
public class SomeClass {
    
    private int a = 0;
    
    /*
     * We will enforce the use of the static methods 
     * by making the constructor private.
     */
    private SomeClass(){};
    
    
    public static SomeClass newInstance() {
        return new SomeClass();
    }
    
    public static SomeClass newInstanceWithFieldSet(int a) {
        SomeClass myInstance = new SomeClass();
        myInstance.setField(a);
        return myInstance;
    }
    
    public void setField(int a) {
        this.a = a;
    }
    
    public int getField() {
        return a;
    }
    
    public static void main (String[] args) {
        SomeClass someClass = SomeClass.newInstanceWithFieldSet(5);
        System.out.println(someClass.getField());
    }
    
}
