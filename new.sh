#!/bin/bash

set -o posix
set -Ceuvx

# Usage: ./new.sh [platform] [problem_id] [difficulty/contest] [problem_name] [language]

PLATFORM=$1        # e.g., "codeforces", "leetcode"
PROBLEM_ID=$2      # e.g., "1823A", "two_sum"
CONTEST_OR_DIFF=$3 # e.g., "1800-1999" (CF) or "easy" (LeetCode)
PROBLEM_NAME=$4    # e.g., "A-characteristic" (optional)
LANGUAGE=$5        # e.g., "py" or "cpp" (programming language)

# Define paths
PLATFORM_DIR="./${PLATFORM}"
CATEGORY_DIR="${PLATFORM_DIR}/${CONTEST_OR_DIFF}"
FILE_PATH="${CATEGORY_DIR}/${PROBLEM_ID}_${PROBLEM_NAME}.${LANGUAGE}"

# Create directory if it doesn't exist
mkdir -p "$CATEGORY_DIR"

# Generate file with template and metadata
cat >"$FILE_PATH" <<EOF
/*
Problem: ${PROBLEM_ID} ${PROBLEM_NAME}
Platform: ${PLATFORM}
Contest/Difficulty: ${CONTEST_OR_DIFF}
URL: TODO_ADD_URL
Memory Limit: TODO_MB
Time Limit: TODO_ms
*/

#include <algorithm> // sort, binary_search, lower_bound, upper_bound, shuffle
#include <bitset>    // bitset - for binary data
#include <cassert>   // assert - for debugging
#include <chrono>    // chrono::steady_clock, chrono::system_clock
#include <climits>   // INT_MAX, INT_MIN
#include <cmath>     // sqrt, pow, abs
#include <cstdint>   // int64_t, uint64_t, etc. - fixed-width integer types
#include <dbg.h> //dbg(…) macro that can be used in place of printf or cout
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

#define USACO_IO(s)                                                            \
    do {                                                                       \
        freopen((s + ".in").c_str(), "r", stdin);                              \
        freopen((s + ".out").c_str(), "w", stdout);                            \
    } while (0)

#define LOCAL_IO                                                               \
    do {                                                                       \
        freopen("input.txt", "r", stdin);                                      \
        freopen("output.txt", "w", stdout);                                    \
    } while (0)

// Constants
const int MOD = 1e9 + 7;
const int INF = 1e9;
const long long int LLINF = 4e18;
const double PI = acos(-1.0);

// Utility Functions
template <typename T> void printVector(const vector<T> &v) {
    for (const auto &x : v)
        cout << x << " ";
    cout << endl;
}

template <typename T> void readVector(vector<T> &v, int n) {
    v.resize(n);
    for (auto &x : v)
        cin >> x;
}

template <typename K, typename V>
void printUnorderedMap(const unordered_map<K, V> &umap) {
    for (const auto &[key, value] : umap) {
        cout << key << ": " << value << endl;
    }
}

template <typename K, typename V>
void readUnorderedMap(unordered_map<K, V> &umap, int n) {
    K key;
    V value;
    for (int i = 0; i < n; ++i) {
        cin >> key >> value;
        umap[key] = value;
    }
}

template <typename T> void printUnorderedSet(const unordered_set<T> &uset) {
    for (const auto &x : uset) {
        cout << x << " ";
    }
    cout << endl;
}

template <typename T> void readUnorderedSet(unordered_set<T> &uset, int n) {
    T x;
    for (int i = 0; i < n; ++i) {
        cin >> x;
        uset.insert(x);
    }
}

template <typename K, typename V> void printMap(const map<K, V> &m) {
    for (const auto &[key, value] : m) {
        cout << key << ": " << value << endl;
    }
}

template <typename K, typename V> void readMap(map<K, V> &m, int n) {
    K key;
    V value;
    for (int i = 0; i < n; ++i) {
        cin >> key >> value;
        m[key] = value;
    }
}

template <typename T> void printSet(const set<T> &s) {
    for (const auto &x : s) {
        cout << x << " ";
    }
    cout << endl;
}

template <typename T> void readSet(set<T> &s, int n) {
    T x;
    for (int i = 0; i < n; ++i) {
        cin >> x;
        s.insert(x);
    }
}

template <typename T1, typename T2> void printPair(const pair<T1, T2> &p) {
    cout << p.first << " " << p.second << endl;
}

template <typename T1, typename T2> void readPair(pair<T1, T2> &p) {
    cin >> p.first >> p.second;
}

template <typename T, size_t N> void printArray(const array<T, N> &arr) {
    for (const auto &x : arr) {
        cout << x << " ";
    }
    cout << endl;
}

template <typename T, size_t N> void readArray(array<T, N> &arr) {
    for (auto &x : arr) {
        cin >> x;
    }
}

template <typename Container> void printContainer(const Container &c) {
    for (const auto &x : c) {
        cout << x << " ";
    }
    cout << endl;
}

template <typename Iterator> void printRange(Iterator begin, Iterator end) {
    for (auto it = begin; it != end; ++it) {
        cout << *it << " ";
    }
    cout << endl;
}

int solve(void) {

    int n;
    if (!(cin >> n)) {
        return EXIT_FAILURE;
    }
    vector<int> nums(n);
    readVector(nums, n);
    sort(nums.begin(), nums.end());
    cout << nums.back() - nums.front() << endl;
    printVector(nums);
    cout << n << '\n';
    return EXIT_SUCCESS;
}

int main(void) {
    // Fast Input/Output
    FAST_IO;

#ifdef LOCAL
    LOCAL_IO;
#endif // LOCAL

#ifdef USACO
    USACO_IO("problem");
#endif // USACO

    int t;
    t = 1;
    cin >> t; // Uncomment for multiple test cases
    for (int i = 0; i < t; i++) {
        if (solve()) {
            break;
        }
    }

    cerr << endl
         << "Finished in " << clock() * 1.0 / CLOCKS_PER_SEC << " sec" << endl;

    return EXIT_SUCCESS;
}
EOF

echo "Created: ${FILE_PATH}"

exit 0
