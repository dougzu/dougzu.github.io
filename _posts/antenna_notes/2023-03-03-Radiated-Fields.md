---
layout: post
title:  "Radiated Fields"
date:   2023-03-03 12:00:00 -0600
categories: antenna_notes
permalink: /antenna_notes/radiated_fields
---
<!-- omit in toc -->
## On This Page
A variety of notes on the properties and characteristics of radiated fields in the far-field region.
- [What causes radiation?](#what-causes-radiation)
- [Radiated Power Flow Density](#radiated-power-flow-density)
- [Radiated Power](#radiated-power)
- [Radiation Intensity](#radiation-intensity)

{% katexmm %}

A note on notation: All vector quantities will have a bar over them while scalar quantities will not. Unit vectors will be represented with a hat (e.g., $\hat{x}$) instead of a bar. Therefore, $\bar{A}=B\hat{x}$ describes a vector called $\bar{A}$ pointing in the x-direction with a magnitude of $B$.

---

## What causes radiation?
Radiation is the result of charges accelerating or decelerating over time. Recall that a charge creates an electric field around it that radiates outwards either forever or until influenced. When a charge moves, the electric field created by that charge also moves. As a result of [Ampere's Law][amperes-law-notes], the changing electric field creates a magnetic field that wraps around the charge.

Because the electric field can only move so fast, the changes in the electric and magnetic fields propagate away from the moving charge. This is what we call radiation.

So: Radiation is caused by the acceleration or deceleration of charges.

## Radiated Power Flow Density
The power flow density of an electromagnetic field, $\bar{S}$, is given by one-half of the cross product between $\bar{E}$ and $\bar{H}^*$.

$$
    \bar{S} = \frac{1}{2}\bar{E}\times\bar{H}^*
$$

Note that $\bar{S}$ is:
1. A vector quantity
2. *Not* the amount of power at some location
 
$\bar{S}$ represents the amount of power flowing in a particular direction through some area. It is not a measure of power, but rather power density.

$\bar{S}$ is a complex value. The imaginary component, which represents the energy stored in the form of standing waves, has no time-average value and therefore does not represent power that can be delivered to some object. Only the real component can have a non-zero time-average value. 


## Radiated Power
To compute the power radiated by an electromagnetic field in a certain area, first find the field's power flow density $(\bar{S})$, take its real component (as only the real-component can have a non-zero time-average value), and integrate it over the area of interest.

$$
    P_{rad} = \frac{1}{2}\int\int\left(\bar{E}\times\bar{H}^*\right)\cdot ds
$$

To find the total power radiated by an antenna, integrate the real component of $\bar{S}$ over a sphere surrounding the antenna.

$$
    P_{rad, total} = \frac{1}{2}\int\int\left(\bar{E}\times\bar{H}^*\right)\cdot ds = \frac{1}{2}\int_{0}^{2\pi}\int_{0}^{\pi}\left(\bar{E}\times\bar{H}^*\right)\cdot \left(\hat{r}r^2\sin\theta d\theta d\phi\right)
$$


## Radiation Intensity
Radiation intensity, $U(\theta, \phi)$, is the amount of power radiated in a direction per unit solid angle (in other words, per unit area).

$$U(\theta,\phi) = S_r(r,\theta,\phi) r^2$$

{% endkatexmm %}


[amperes-law-notes]: ./maxwells_equations#amperes-law