**Complex Cells (at Multiple Orientations)**

Combining the outputs of complex cells selective to different orientations can be used to detect edges regardless of phase and orientation.

In this question, work with the **elephant image** after converting it from **uint8** format to **double** format.

Using the method and parameters described in the **week 4 MATLAB exercise on Complex Cells**, simulate the output of complex cells at the following orientations:
[0, 15, 30, 45, 60, 75, 90, 105, 120, 135, 150, 165]

Combine the outputs of these complex cells by taking the **maximum response** of all complex cells at each pixel location. Show an image of the result.

You will need the m-file **"gabor2.m"** to create Gabor filters. This file is available from the module's KEATS webpage. Copy this m-file into the directory where you are executing MATLAB.

---

### **EXERCISE**

**Question 1**
For the image you have created, report the value at the following location (correct to at least 2 decimal places):
Row = 290, Column = 292

**Question 2**
For the image you have created, report the value at the following location (correct to at least 2 decimal places):
Row = 331, Column = 147

