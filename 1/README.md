**Redundancy Reduction by Retinal Ganglion Cells (simulated with Difference of Gaussians)**

Retinal ganglion cells reduce redundancy. To simulate a retinal ganglion cell, we use a Difference of Gaussians (DoG) mask. Produce an **on-centre, off-surround DoG mask** by subtracting a Gaussian mask with a standard deviation of **3.0** from a Gaussian mask with a standard deviation of **1.5**. Use the MATLAB command `fspecial` to create the Gaussian masks that are subtracted from each other.

To simulate the response of retinal ganglion cells to all different parts of an image, we convolve the DoG mask with the image. Use the DoG mask, defined as described in the previous paragraph, to simulate the responses of **on-centre, off-surround retinal ganglion cells** to all different parts of the **woods image**. Before performing the convolution, convert the woods image from **uint8** format to **double** format. Ensure that the output of the convolution is the same size as the input image. Show the result.

Use the **correlation coefficient**, which can be calculated for two equally sized images (or image patches) using the MATLAB command `corr2`, to measure the similarity between the output of the simulated retinal ganglion cells at neighbouring locations. Ensure that the two image parts being compared are as large as possible by using the method described in **week02's MATLAB exercise**. Plot a graph of the **correlation coefficients** calculated between the DoG-convolved image and the same image shifted by **0 to 30 pixels vertically**.

---

### **EXERCISE**

**Question 1**
For the output produced by convolving the image with the DoG mask, report the value at the following location (correct to at least 2 decimal places):
Row = 101, Column = 151

**Question 2**
Report the correlation coefficient (correct to at least 2 decimal places) for the following shift:
3-pixel shift

**Question 3**
Report the correlation coefficient (correct to at least 2 decimal places) for the following shift:
22-pixel shift
