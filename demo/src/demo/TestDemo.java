package demo;

interface IMessage<P, R> {
	public R zhuanhuan(P p);
}

public class TestDemo {
	public static void main(String[] args) {
		IMessage<Integer, String> msg = String::valueOf;
		String str = msg.zhuanhuan(1000);

	}
}
