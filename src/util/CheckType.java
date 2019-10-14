package util;

public class CheckType
{
	public static boolean checkInt(String args) {
		try {
			Integer.parseInt(args);
			return true;
		}catch(NumberFormatException e){
			return false;
		}
	}
	public static boolean checkDouble(String args) {
		try {
			Double.parseDouble(args);
			return true;
		}catch(NumberFormatException e){
			return false;
		}
	}
}
