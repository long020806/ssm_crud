package com.crud;

import java.util.ArrayList;
import java.util.List;

/**
 * @author TODO
 * @date 2021/10/9 10:58
 **/
public class code_test {
    public static void main(String[] args) {

    }

}
class SummaryRanges {
    List<int[]> list = new ArrayList<>();
    int[] head = new int[]{-10, -10}, tail = new int[]{10010, 10010};
    public SummaryRanges() {
        list.add(head);
        list.add(tail);
    }
    public void addNum(int val) {
        int n = list.size();
        int l = 0, r = n - 1;
        while (l < r) {
            int mid = l + r + 1 >> 1;
            if (list.get(mid)[0] <= val) l = mid;
            else r = mid - 1;
        }
        int[] cur = new int[]{val, val};
        int[] prev = list.get(r);
        int[] next = list.get(r + 1);
        if ((prev[0] <= val && val <= prev[1]) || (next[0] <= val && val <= next[1])) {
            // pass
        } else if (prev[1] + 1 == val && val == next[0] - 1) {
            prev[1] = next[1];
            list.remove(next);

        } else if (prev[1] + 1 == val) {
            prev[1] = val;
        } else if (next[0] - 1 == val) {
            next[0] = val;
        } else {
            list.add(r + 1, cur);
        }
    }
    public int[][] getIntervals() {
        int n = list.size();
        int[][] ans = new int[n - 2][2];
        int idx = 0;
        for (int i = 1; i < n - 1; i++) ans[idx++] = list.get(i);
        return ans;
    }
}