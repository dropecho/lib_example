## A haxe library template/example for multiple targets (npm/haxelib).

#### Use as template

Rename package in haxelib.json  
Ensure all deps are included as needed (genes for esm, hxcs etc).  
Rename package in package.json  
Rename package in .releaserc.json  

Update readme, license as required.  
Replace src and tests.

#### Output

The CS is built into dist/cs  
The release is added to GH via .releaserc and named there. 

The JS is built into dist/js/cjs and dist/js/esm.  
With package exports, should work for both ESM and CJS imports.
