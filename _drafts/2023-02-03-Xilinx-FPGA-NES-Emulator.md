---
layout: post
title:  "NES Emulator Implemented on a Xilinx FPGA"
date:   2023-02-03 12:00:00 -0600
categories: blog
---
## On This Page
1. 

---
Some friends and I recently worked on an NES emulator implemented on a Xilinx Zynq-7020 FPGA for class. It was a very fun project. Because it was my first time working on an FPGA, and first time writing embedded in a long time, I learned a lot. I feel like it deserves being written about for my future reference.


## Creating a VGA Driver
Because the emulator is built on an FPGA, many hardware interfaces that are usually taken for granted do not exist. We needed to build a hardware

Custom hardware needs to be designed, synthesized, and flashed for almost all external interface - for example

 on the FPGA itself for almost 

, hardware for driving a VGA display needs to built. The hardware should look in memory 

First, let's look at how the VGA protocol works.

### The VGA Protocol
The VGA protocol was originally developed to be used with CRT displays 

### The Hardware
To implement a VGA driver in hardware, several things are needed:
1. Memory
The ZedBoard runs a Z-7020 SoC from Xilinx as the FPGA. 

## Patching the NES Emulator

## SNES Controller Support

## Sound!

## Source Code & Hardware Files
Because this project was done for a class, and its a rather rigorous project, I'm going to keep the source files private.