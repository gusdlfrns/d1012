package d1011;

public class Exam04 {

	public static int max(int x, int y) {
		int result;
		if(x>y) {
			result=x;
		}else {
			result=y;
		}
		return result;
	}
	public static void main(String[] args) {
		int n1=15,n2=20;
		int num=max(n1,n2);
		System.out.printf("%d와 %d중 큰 수는 %d입니다.\n",n1,n2,num);
		
	}

}
