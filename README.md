# dropecho.lib_example

A template / starting point for a Haxe library that compiles to multiple targets and is
published to both **haxelib** and **npm**. Clone it, rename, and replace the example code.

## Targets

| Target | Output | Status |
|---|---|---|
| JS (CommonJS) | `dist/js/cjs/index.cjs` | on by default |
| JS (ES module + `.d.ts`) | `dist/js/esm/index.js` | on by default |
| C# (DLL) | `dist/cs/dropecho.lib_example` | on by default |
| Python | `dist/python/lib_example.py` | commented in `build.hxml` |
| Godot GDScript | `dist/gdscript/` | commented in `build.hxml` |
| API docs (dox XML) | `artifacts/docs.xml` | commented in `build.hxml` |

## Develop

```bash
npm install     # fetch pinned Haxe + libs via lix (runs `lix download`)
npm run build   # build the enabled targets (haxe build.hxml)
npm test        # run the utest suite via dropecho.testing (lix dropecho.testing)
npm run clean   # remove dist/ and artifacts/
```

- Dependencies are managed by [lix](https://github.com/lix-pm/lix.client) (a `devDependency`,
  so no global install is needed): the Haxe version is pinned in `.haxerc` and each lib in
  `haxe_libraries/`. `npm install` installs lix, then runs `lix download` to materialize them.
- Build options are split into shared settings (top of `build.hxml`) and one hxml per target
  under `targets/`. Enable a target by uncommenting its `--next targets/<name>.hxml` pair.
- Tests are auto-discovered: every `test/**/*Tests.hx` class that `extends utest.Test` is
  registered by `dropecho.testing` — there is no test main to maintain.

## Use as a template

1. Rename the package in `haxelib.json`, `package.json`, and `.releaserc.json`.
2. Move/rename `src/dropecho/lib_example/` to your own package and update the `@:expose` names.
3. Set `root_package` in `.dropecho.testing.json` to your library's package.
4. Adjust output paths and enabled targets in `build.hxml` + `targets/*.hxml`.
5. Replace the example sources and `*Tests.hx`; refresh this README and `LICENSE.md`.

Pin any target's extra dependencies with lix (e.g. `lix install haxelib:genes` for the ESM
build, `hxcs` for C#, `gdscript` for GDScript) — it writes the lock to `haxe_libraries/`.

## JavaScript output

The CommonJS and ESM builds are wired up through `package.json` `exports`, so the package
works for both `require` and `import`. The ESM build also emits `.d.ts` typings via genes.

## Releases

Releases are automated with `semantic-release` (see `.releaserc.json`): commits drive the
version bump, and the package is published to npm and haxelib with a generated changelog.

## License

MIT
