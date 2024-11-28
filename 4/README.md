**Equivalent LoG and DoG Masks**

The result of convolving an image with a **Difference of Gaussians (DoG) mask** is similar to the result of convolving an image with a **Laplacian of Gaussian (LoG) mask**: both masks perform edge detection. It is possible to approximate a LoG mask using a DoG, and your task is to determine the **standard deviations** of the Gaussians used to create a DoG mask that will accurately approximate a LoG mask.

Create a **Difference of Gaussians mask** by subtracting one Gaussian (with a standard deviation of **6**) from another Gaussian (with a standard deviation of **3**).

Create a **Laplacian of Gaussian mask** by convolving a 2-D Gaussian with a standard deviation of **4.0** with the following Laplacian mask:

```
-1/8 -1/8 -1/8
-1/8 1-1/8 
-1/8 -1/8 -1/8
```

Ensure that the resulting LoG mask is sufficiently large to accurately represent the LoG function.

Calculate a numerical measure of the similarity between the DoG and LoG masks using the following commands:
```matlab
log=log./max(max(log));
dog=dog./max(max(dog));
sqrt(sum(sum((dog-log).^2)))
```

The above assumes that you have given your **LoG mask** the variable name `log`, your **DoG mask** the variable name `dog`, and that you have created two masks of the same size. It finds the **Euclidean distance** between the DoG and LoG masks after they have both been scaled to have the same amplitude.

---

### **EXERCISE**

Write a programme that will systematically vary the **standard deviations** (in steps of **0.10**) for the two Gaussians used to generate the DoG mask. Use this code to search for the values of these **standard deviations** which will generate a DoG mask that is as similar as possible (as measured using the above code) to the LoG mask created using a Gaussian with a standard deviation of **4.0**.

**Question 1**
Report the smaller standard deviation you have found:
Smaller standard deviation =

**Question 2**
Report the larger standard deviation you have found:
Larger standard deviation =

