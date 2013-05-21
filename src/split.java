
public class split {

	public String Split(String s){
		String sp[] = s.split("\\.");
		String ss[] = s.split(";");
		String part1 = ss[1];
		//System.out.println(sp[1]);
		//String part2 = sp[1];
		return part1;
	}
	public static void main(String args[])
	{
		split ref = new split();
		String s = ref.Split("12;12;rohit.txt");
		System.out.println(s);
		
	}
}
