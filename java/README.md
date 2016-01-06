java Cookbook
=================
This cookbook install open-java by default or oracle-java if you specify the "::oracle-java" recipe.
First, the recipes will run the "apt" cookbook because "oracle-java" recipe  need to run "apt" cookbook first to set up the PPA repository

Requirements
------------
It requires the node[:java][:openjdk_version] or node[:java][:oracle_version] to be set with the version number (eg. 6)

Attributes
----------
none

Usage
-----
#### java::default
or
#### java::oracle-java

Observations
------------
The "oracle-java" recipe will run "apt" cookbook first because it needs to set up the PPA repo.

License and Authors
-------------------

Authors: Rus Cosmin
