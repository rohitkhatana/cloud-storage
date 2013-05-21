import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class Sha256 {

	 String sha256(String inp)
	    {
	    
	    	MessageDigest md;
			try {
				md = MessageDigest.getInstance("SHA-256");
				md.update(inp.getBytes());
		    	byte byteData[] = md.digest();
		    	StringBuffer hexString= new StringBuffer();
		    	for(int i =0;i<byteData.length;i++)
		    	{
		    		String s = Integer.toHexString(0xff & byteData[i]);
		    		hexString.append(s);
		    	}
		    	random ran = new random();
		    	String salt = ran.genranString();
		    	hexString.append(',');
		    	hexString.append(salt);
		    	return hexString.toString();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	return null;
	    	
	    }
}
