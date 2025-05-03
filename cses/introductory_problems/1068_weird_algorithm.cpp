/*
Problem: 1068 weird_algorithm
Platform: cses
Contest/Difficulty: introductory_problems
URL: TODO_ADD_URL
Memory Limit: TODO_MB
Time Limit: TODO_ms
*/
// main.cpp

#include <algorithm>  // sort, binary_search, lower_bound, upper_bound, shuffle
#include <bitset>     // bitset - for binary data
#include <cassert>    // assert - for debugging
#include <chrono>     // chrono::steady_clock, chrono::system_clock
#include <climits>    // INT_MAX, INT_MIN
#include <cmath>      // sqrt, pow, abs
#include <cstdint>    // int64_t, uint64_t, etc. - fixed-width integer types
#include <functional> // greater, less - function objects and operations
#include <iostream>   // cout, cin, endl - Input/Output
#include <iterator>   // iterators and related items
#include <map>     // map, multimap - (non-hashed, tree) ordered key-value pairs
#include <numeric> // accumulate, gcd, lcm - numeric operations
#include <queue>   // queue, priority_queue
#include <random>  // mt19937, mt19937_64 (higher quality RNG than rand())
#include <set>     // set, multiset - (non-hashed, tree) ordered set
#include <stack>   // stack
#include <string>  // string
#include <tuple>
#include <unordered_map> // unordered_map - hash map
#include <unordered_set> // unordered_set - hash set
#include <utility>       // pair
#include <vector>        // vector - dynamic array

using namespace std;

// Macros

#define FAST_IO                                                                \
    ios_base::sync_with_stdio(false);                                          \
    cin.tie(NULL);                                                             \
    cout.tie(NULL);

// Constants
const int MOD = 1e9 + 7;
const int INF = 1e9;
const long long int LLINF = 4e18;
const double PI = acos(-1.0);

// Debugging
#ifdef LOCAL
#define debug(x) cerr << #x << " = " << x << endl;
#else
#define debug(x)
#endif

// Utility Functions
template <typename T> void printVec(const vector<T> &v) {
    for (const auto &x : v)
        cout << x << " ";
    cout << endl;
}

template <typename T> void readVec(vector<T> &v, int n) {
    v.resize(n);
    for (auto &x : v)
        cin >> x;
}

long long int gcd(long long int a, long long int b) {
    return b ? gcd(b, a % b) : a;
}
long long int lcm(long long int a, long long int b) {
    return a / gcd(a, b) * b;
}
long long int powmod(long long int a, long long int b) {
    long long int res = 1;
    a %= MOD;
    for (; b; b >>= 1) {
        if (b & 1)
            res = res * a % MOD;
        a = a * a % MOD;
    }
    return res;
}
int solve(void) {

    long long int n;
    if (!(cin >> n)) {
        return EXIT_FAILURE;
    }
    while (n >= 1) {
        cout << n << ' ';
        if (n == 1)
            break;
        else if (n & 1) {
            n *= 3;
            n++;
        } else {
            n /= 2;
        }
        // cout << n << ' ';
    }

    // cout << n << '\n';
    return EXIT_SUCCESS;
}

int main(void) {
    // Fast Input/Output
    FAST_IO;

#ifdef LOCAL
    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);
#endif // LOCAL

#ifdef USACO
    freopen("problem.in", "r", stdin);
    freopen("problem.out", "w", stdout);
#endif // USACO

    int t = 1;
    // cin >> t; // Uncomment for multiple test cases
    for (int i = 0; i < t; i++) {
        if (solve()) {
            break;
        }
        // cout << "##########################" << endl;
    }

    cerr << endl
         << "Finished in " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << endl;

    return EXIT_SUCCESS;
}
