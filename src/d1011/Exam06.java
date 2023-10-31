package d1011;

public class Exam06 {
	public static void calc(int x, int y) {
		System.out.println(x*y);
	}
	public static void calc(int x) {
		System.out.println(x*x);
	}
	public static void calc(int x, double y) {
		System.out.println(x*y);
	}
	public static void calc(double x, int y) {
		System.out.println(x*y);
	}
	public static void calc(double x, double y) {
		System.out.println(x*y);
	}
	public static void main(String[] args) {
		calc(10);
		calc(10,5);
		calc(10,5.5);
		calc(10.5,5);
		calc(10.5,5.5);

	}

}
