package d1011;

public class Exam02 {
	public static void method() {
		System.out.println("static 메써드입니다.");
		System.out.println(5+6);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("첫번째 호출 메서드입니다.");
		
		method();
		
		System.out.println("두번째 호출 메서드입니다.");
		
		method();
	}

}
