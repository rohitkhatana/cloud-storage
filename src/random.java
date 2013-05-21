
import java.util.Random;
//import java.util.Random.*;

//import javax.print.DocFlavor.CHAR_ARRAY;
public class random {
	private static final String CHAR_LIST = 
	        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
	public String genranString(){
		StringBuffer r = new StringBuffer();
		for(int i=0;i < 5;i++)
		{
			int nu = getRandomNumber();
			char ch = CHAR_LIST.charAt(nu);
			r.append(ch);
		}
		return r.toString();
		
	}
	private int getRandomNumber()
	{
		int randomInt =0;
		//Random randomGenerator = new Random();
		Random rg = new Random();
		randomInt = rg.nextInt(CHAR_LIST.length());
		if(randomInt - 1 == -1){
			return randomInt;
		}
		else
		{
			return randomInt-1;
		}
	}
	public static void main(String arg[])
	{
		random ran = new random();
		String ranString = ran.genranString();
		System.out.println(ranString);
	}
	//random
	
}
