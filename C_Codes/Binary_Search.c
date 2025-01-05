int binsearch(const int arr[], int needle, int size) {
    int mid;
    int left = 0;
    int right = size - 1;

    while (left <= right) {
        mid = (left + right) / 2;
        if (needle > arr[mid]) {
            left = mid + 1;
        }
        else if (needle < arr[mid]) {
            right = mid - 1;
        }
        else {
            return mid;
        }
    }
    return -1;
}
