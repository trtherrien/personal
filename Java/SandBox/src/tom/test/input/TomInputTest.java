package tom.test.input;

import javax.swing.JOptionPane;

public class TomInputTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		String test = (String)JOptionPane.showInputDialog(null, "Enter IP", "Enter IP", JOptionPane.QUESTION_MESSAGE,null,null, "192.168.31.11");
		System.out.println(test);
		
	}

}
