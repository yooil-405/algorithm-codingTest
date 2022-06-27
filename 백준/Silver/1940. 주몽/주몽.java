import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {

	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int N = Integer.parseInt(br.readLine());
		int M = Integer.parseInt(br.readLine());
		StringTokenizer st = new StringTokenizer(br.readLine());
		int[] arr = new int[N];
		
		for (int i = 0; i < arr.length; i++) {
			arr[i] = Integer.parseInt(st.nextToken());
		}
		
		Arrays.sort(arr);
		
		int start = 0;
		int end = arr.length - 1;
		int res = 0;
		while(start < end) {
			int sum = arr[start] + arr[end];
			if (sum < M) {
				start++;
			}
			if (sum > M) {
				end--;
			}
			if (sum == M) {
				res++;
				start++;
			}
		}
		System.out.println(res);
	}
}
