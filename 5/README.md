**Laplacian Image Pyramid**

A **Laplacian image pyramid** is a multi-scale representation of a single image that highlights intensity discontinuities at multiple scales. It is obtained by convolving an image with a Gaussian mask and subtracting the smoothed image from the original one. The next level of the pyramid is obtained by repeating this process on the smoothed image after it is down-sampled.

Create a **3-level Laplacian image pyramid** of the **woods image** (after conversion from **uint8** to **double** format), using:
- A Gaussian with a standard deviation of **1.5**
- `"same"` as the shape parameter for the `conv2` function
- Resizing by a scale factor of **0.5** using **nearest-neighbour interpolation**

Display the images in the pyramid as **subplots in the same window**.

---

### **EXERCISE**

**Question 1**
For the last level of the pyramid, report the value at the following location (correct to at least 2 decimal places):
Row = 5, Column = 9

**Question 2**
For the last level of the pyramid, report the value at the following location (correct to at least 2 decimal places):
Row = 2, Column = 2

