---
layout: post
title:  "Practice Problems"
date:   2023-03-03 12:00:00 -0600
categories: antenna_notes
permalink: /antenna_notes/practice_problems
---
<!-- omit in toc -->
## On This Page
A subset of problems, and my solutions, that I did while learning antennas that I feel helped with my understanding.
- [Problem 1](#problem-1)
  - [Solution](#solution)
- [Directivity](#directivity)
- [Gain](#gain)
- [Polarization](#polarization)


---
{% katexmm %}

A note on notation: All vector quantities will have a bar over them while scalar quantities will not. Unit vectors will be represented with a hat (e.g., $\hat{x}$) instead of a bar. Therefore, $\bar{A}=B\hat{x}$ describes a vector called $\bar{A}$ pointing in the x-direction with a magnitude of $B$.

## Problem 1
A $\lambda/2$ dipole situated with its center at the origin radiates a time-averaged power of $600$ W at a frequency of $200$ MHz. A second $\lambda/2$ dipole is placed with its center at a point $P(r, \theta, \phi)$, where $r=100$ m, $\theta=60\degree$, and $\phi=40\degree$. It is oriented so that its axis is parallel to that of the transmitting antenna. What is the available power at the terminals of the second (receiving) dipole?
### Solution

Antenna efficiency, $e_0$, is the ratio of power radiated to the net power provided to an antenna. 

$$
    e_0 = \frac{P_{rad}}{P_{in}}
$$

Many factors can affect antenna efficiency, but some of the largest factors include inefficiencies due to impedance mismatches $(e_{ref})$, inefficiencies due to ohmic resistance $(e_c)$, and inefficiencies due to the dielectric around the antenna $(e_d)$. This inefficiencies all build into $e_0$.

$$
    e_0 = e_{ref}e_ce_d
$$

Where the product of $e_c$ and $e_d$ is often referred to as the radiation efficiency, $e_r$.

## Directivity
Directivity is the ratio of the [radiation intensity][radiated-fields], in some direction, to the average radiation intensity of an antenna. In the spherical coordinate system, this is expressed as:

$$D(\theta,\phi) = \frac{U(\theta,\phi)}{U_{avg}}$$

## Gain
Gain is similar to directivity except that it includes the inefficiencies of an antenna. It is often provided in datasheets, instead of directivity, because of this. Gain is given by:

$$
    G(\theta, \phi) = e_rD(\theta, \phi)
$$

Where $e_r$ is the radiation efficiency of the antenna.


Equivalently, it can be thought of as $4\pi$ times the radiation intensity divided by the total input power.

$$
    G(\theta, \phi) = 4\pi \frac{U(\theta, \phi)}{P_{in}}
$$


## Polarization


{% endkatexmm %}


[maxwell-equations]: ./maxwells_equations
[radiated-fields]: ./radiated_fields