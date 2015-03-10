#!/bin/bash
knife node list;do knife node delete -y $i & knife client delete -y $i & done && wait && echo DONE
