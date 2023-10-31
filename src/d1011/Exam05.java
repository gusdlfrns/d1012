package d1011;

public class Exam05 {
	public static int sum() {
		int sum=0;
		for(int i=1; i<=10; i++) {
			sum+=i;							
		}
		return sum;
	}
	public static void main(String[] args) {
		System.out.print("1부터 10까지의 합은? : "+sum());
	}

}
