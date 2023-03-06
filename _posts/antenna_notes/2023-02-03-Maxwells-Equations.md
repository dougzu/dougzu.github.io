---
layout: post
title:  "Maxwell's Equations"
date:   2023-02-03 12:00:00 -0600
categories: antenna_notes
permalink: /antenna_notes/maxwells_equations/
---
## On This Page
A brief overview of Maxwell's equations with a focus on explaining what they mean instead of how they're derived.
1. [Important Fields, Variables, and Phenomenon](#important-fields-variables-and-phenomenon)
    1. [Polarization](#polarization)
    2. [Material Permittivity](#material-permittivity)
    3. [Electric Displacement Field](#electric-displacement-field)
    4. [Polarization Density](#polarization-density)
    5. [Electric Field](#electric-field)
2. [The Equations](#the-equations)
    1. [Gauss' Law](#gauss-law)
    2. [Gauss' Magnetic Law](#gauss-magnetic-law)
    3. [Faraday's Law](#faradays-law)
    4. [Ampere's Law](#amperes-law)


---
{% katexmm %}

A note on notation: Moving forward, all vector quantities will have a bar over them while scalar quantities will not. Unit vectors will be represented with a hat (e.g., $\hat{x}$) instead of a bar. Therefore, $\bar{A}=B\hat{x}$ describes a vector called $\bar{A}$ pointing in the x-direction with a magnitude of $B$.

## Important Fields, Variables, and Phenomenon
### Polarization
Polarization refers to when charges in atoms shift position as a result of an electric force being applied to them. These charges come in two forms: Charges that are in the conduction band and flow freely (free charges) and charges that are in lower bands (bound charges). The shifting of these charges causes the atom to have a new net charge.

As an example of polarization, consider a parallel plate capacitor. When a voltage is applied across the capacitor, a field forms between the two plates. The atoms in the capacitor dielectric shift slightly so that their negative charges are closer to the positively-charged plate and their positive charges are closer to the negatively-charged plate. The dielectric material has polarized. When the external field is removed, a net charge will still exist across the dielectric as it takes time for the atoms to return to their original state.

### Material Permittivity
The permittivity of a material, $\epsilon$, is a metric for how much a material polarizes when an electric force acts upon it (for example, an electric field). It has the units of $C/(V\cdot m)$, which can be thought of as "how many coulombs of charge are there, per meter, if I apply a voltage across a material."

### Electric Displacement Field
The electric displacement field, $\bar{D}$, is a measure of how much *free* charge exists and is moving in some direction, in a unit area. It has units of $C/m^2$.

### Polarization Density
The polarization density, $\bar{P}$, of a material represents how much *bound* charge exists in a unit area. It has units of $C/m^2$.

### Electric Field
The electric field, $\bar{E}$, at some location is a vector quantity that represents the force that a one-Coulomb test charge would experience if placed at that location. It has units of $N/C$ or $V/m$.

The amount of electric field that exists at the surface of a material is dependent on the charge density of the material (that is, how many free- and bounded-charges exist in a unit area), as well as how much energy is required to move those charges (permittivity). Mathematically, $\bar{E}$ may be expressed as:

$$\bar{E} = \frac{\bar{D} - \bar{J}}{\epsilon}.$$

This can be interpreted as: 

> I have two sources of charge: Free charges and bound charges. I have $\bar{D}$ free charges, in a unit area, moving in a direction. If I divide $\bar{D}$ by the amount of energy it takes to move a charge one meter, I can obtain the total amount of energy being applied over one meter.
> 
> I also have $\bar{J}$ in a unit area that are shifting to align with the external field. Their alignment will decrease the net field. If I divide $\bar{J}$ by the amount of energy it takes to move charge one meter, I can obtain the total amount of energy being applied over one meter against the external field.

Importantly, electric field is very dependent on the material it is generated in. This is because the electric field is dependent on $\epsilon$. This is a significant reason that we often $\bar{D}$ instead.

Electric field has units of $F/m$ or $C/(V\cdot m)$.

## The Equations
Maxwell's equations are a collection of four equations that together describe the interaction of electric fields, magnetic fields, charges, and currents. They are often formulated in either integral or differential form. Differential form is easier to deal with when studying specific points in space and time, while integral form is more useful when dealing with ...

The four equations, in differential form, are as follows:

| Name | Differential Equation | 
| - | - |
| Gauss' Law | $\nabla\cdot\bar{D} = \rho_V$ |
| Gauss' Magnetism law | $\nabla\cdot\bar{B} = 0$ |
| Faraday's Law | $\nabla\times\bar{E} = -\frac{\partial \bar{B}}{\partial t}$ |
| Ampere's Law | $\nabla\times\bar{H} = \frac{\partial \bar{D}}{\partial t} + \bar{J}$ |

Where $\bar{D}$ is electric displacement field, $\rho_V$ is electric charge density, $\bar{B}$ is magnetic field, $\bar{E}$ is electric field, $\bar{H}$ is magnetic flux density, and $\bar{J}$ is electric current density. 

### Gauss' Law
Gauss' Law states that the total amount of electric displacement field leaving some boundary is equal to the amount of charge contained within that boundary. Said in other words, the total number of free charges leaving some boundary is equal to the amount of charge contained within that boundary. 


### Gauss' Magnetic Law
Gauss' Magnetic Law states that the magnetic fields leaving a boundary must be equal to zero. In other words, either nothing exits or enters, or the same amount that exits also enters.

### Faraday's Law

### Ampere's Law



{% endkatexmm %}