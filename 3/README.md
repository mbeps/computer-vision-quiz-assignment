**Laplacian of Gaussian (LoG) Masks**

A method of combining a derivative mask with a smoothing mask to perform edge detection is provided by the **Laplacian of Gaussian (LoG) mask**. This is obtained by combining the omni-directional second-derivative mask (the Laplacian) with a Gaussian.

Create two Laplacian of Gaussian masks by convolving a 2-D Gaussian (one with a standard deviation of **1.5** and another with a standard deviation of **5**) with the following Laplacian mask:

```
-1/8 -1/8 -1/8
-1/8 1-1/8 
-1/8 -1/8 -1/8
```

Ensure that the resulting masks are sufficiently large to accurately represent the LoG functions.

Generate mesh plots of the two Laplacian of Gaussian masks you have created, placing these in:
- `subplot(2,2,1)`
- `subplot(2,2,2)`

Use the **woods image** converted from **uint8** to **double** format. Convolve the woods image with each of the Laplacian of Gaussian masks you have created (using `"same"` as the shape parameter for the `conv2` function). Display images showing the output of these two convolutions in:
- `subplot(2,2,3)`
- `subplot(2,2,4)`

All outputs should appear in the same figure window.

---

### **EXERCISE**

**Question 1**
For the output produced by convolving the woods image with the LoG (produced using the Gaussian with the smaller standard deviation), report the value at the following location (correct to at least 2 decimal places):
Row = 169, Column = 4

**Question 2**
For the output produced by convolving the woods image with the LoG (produced using the Gaussian with the smaller standard deviation), report the value at the following location (correct to at least 2 decimal places):
Row = 134, Column = 13

**Question 3**
For the output produced by convolving the woods image with the LoG (produced using the Gaussian with the larger standard deviation), report the value at the following location (correct to at least 2 decimal places):
Row = 169, Column = 4

**Question 4**
For the output produced by convolving the woods image with the LoG (produced using the Gaussian with the larger standard deviation), report the value at the following location (correct to at least 2 decimal places):
Row = 134, Column = 13

