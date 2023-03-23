#!/bin/bash

cd $1
mkdir $2
cd $2
touch "$2".typ
touch "$2".pdf

echo '#import "../../template.typ": *

#show: project.with(
  title: "TITLE HERE",
  authors: (
    (name: "Raul Escobar", email: "raulescobar_g@tamu.edu"),
  ),
  date: "DATE HERE",
)

= Problem 1
#line(length: 100%)

= Problem 2
#line(length: 100%)

= Problem 3
#line(length: 100%)' >> "$2".typ

typst "$2".typ "$2".pdf