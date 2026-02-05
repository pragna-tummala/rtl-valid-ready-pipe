# rtl-valid-ready-pipe
# Single-Stage Valid/Ready Pipeline Register

## Description
This repository contains a fully synthesizable SystemVerilog implementation of a single-stage pipeline register using a standard valid/ready handshake.

## Features
- Accepts input data when `in_valid && in_ready`
- Presents stored data on output with `out_valid`
- Correctly handles downstream backpressure
- Ensures no data loss or duplication
- Fully synthesizable RTL
- Resets to a clean empty state

## Design Overview
The module acts as a one-entry elastic buffer between input and output interfaces. It stores data when the output side is not ready and forwards data immediately when possible.

## Files
- `rtl/pipe_reg_valid_ready.sv` – RTL implementation of the pipeline register

## Interface
Standard valid/ready handshake signals are used on both input and output interfaces.
