/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tom.therrien.builder;

/**
 *
 * @author trtherrien
 */
public class NutritionalInformation {
    private final int servingSize;
    private final int servings;
    private final int calories;
    private final int fat;
    private final int carbohydrates;
    private final int sodium;
    
    public static class Builder {
        private final int servingSize;
        private final int servings;
        private int calories = 0;
        private int fat = 0;
        private int carbohydrates = 0;
        private int sodium = 0;
        
        public Builder(int servingSize, int servings) {
            this.servingSize = servingSize;
            this.servings = servings;
        }
        
        public Builder calories(int val) {
            calories = val;
            return this;
        }
        
        public Builder fat(int val) {
            fat = val;
            return this;
        }
        
        public Builder carbohydrates(int val) {
            carbohydrates = val;
            return this;
        }
        
        public Builder sodium(int val) {
            sodium = val;
            return this;
        }
        
        public NutritionalInformation build() {
            return new NutritionalInformation(this);
        }
        
    }  
    
    private NutritionalInformation(Builder builder) {
        servingSize = builder.servingSize;
        servings = builder.servings;
        calories = builder.calories;
        fat = builder.fat;
        sodium = builder.sodium;
        carbohydrates = builder.carbohydrates;
    }
    
    public static void main(String[] args) {
        NutritionalInformation cocaCola = new NutritionalInformation.Builder(240, 8).calories(100).sodium(35).carbohydrates(27).build();
        System.out.println(cocaCola.sodium);
    }
}
