/*
 * This also does the observer pattern
 */
package tom.therrien.MVC;

import javax.swing.SwingUtilities;

public class MVCMain {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SwingUtilities.invokeLater(new Runnable() {

			@Override
			public void run() {
				runApp();
			}
			
		});
	}
	
	public static void runApp() {
		Model model = new Model();
		View view = new View(model);
		Controller controller = new Controller(model, view);
	}

}
