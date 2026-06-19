# AGENTS.md — dropecho.lib_example

Single source of truth for all AI agents working on this project.

## Agent Instructions

- **Always use the `haxe` skill** when reading or writing any `.hx` or `.hxml` file.
- **Always use the Haxe LSP** (`LSP` tool) for navigating code — go-to-definition, find
  references, hover types — before grepping or reading files manually.
- **Never co-author or co-sign commits.** Do not add `Co-Authored-By` trailers,
  `Signed-off-by` lines, or any other attribution/sign-off trailers to commit messages.
- **Never add section/region divider comments** (e.g. `// ── Foo ──`, `// --- Foo ---`,
  `#region`). Organize code with ordering and doc comments instead.

---

## Project Overview

**dropecho.lib_example** (`haxelib: dropecho.lib_example`, npm: `@dropecho/lib_example`) is a
**template / starting point** for a Haxe library that compiles to multiple targets and is
published to both haxelib and npm. Clone it, rename, and replace the example code.

- **Targets:** JS CommonJS, JS ES module (+ `.d.ts` via genes), C# (DLL). Python, Godot
  GDScript, and docs targets ship commented-out in `build.hxml`.
- **Test runner:** `dropecho.testing` (auto-discovery) over `utest`; `instrument` for coverage.
- **Dependencies:** managed by [lix](https://github.com/lix-pm/lix.client), declared as a
  `devDependency` so `npm install` puts its `haxe`/`haxelib` shims on the npm-script `PATH`
  (no global lix needed). The Haxe version is pinned in `.haxerc`; each enabled target's libs
  are pinned in `haxe_libraries/*.hxml`. The shimmed `haxe` resolves libs from those files
  (scoped, not global haxelib). Opt-in targets (e.g. GDScript's `gdscript`) are not pinned
  until you `lix install` them.
- **Source root:** `src/` · **Tests root:** `test/`
- **Releases:** automated via `semantic-release` (+ `semantic-release-haxelib`).

---

## Using this as a template

1. Rename the package in `haxelib.json`, `package.json`, and `.releaserc.json`.
2. Move/rename `src/dropecho/lib_example/` to your own package and update `@:expose` names.
3. Update `root_package` in `.dropecho.testing.json` to your library's package.
4. Adjust the output paths and enabled targets in `build.hxml` + `targets/*.hxml`.
5. Replace the example sources and `*Tests.hx`, refresh `README.md` and `LICENSE.md`.
6. Run `npm install` (→ `lix download`) to fetch the pinned Haxe + libs, then `npm test`.
   Pin a different Haxe version with `lix install haxe <version>`; manage libs with `lix install`.

---

## Directory Layout

```
src/dropecho/lib_example/   # library source (replace with your own package)
  LibExample.hx             # static-utility example, @:expose("LibExample")
  OtherExample.hx           # instance example, @:expose("OtherExample")
  other/Example.hx          # sub-package example, @:expose("example.Nested")
test/                       # utest cases, auto-discovered by filename (*Tests.hx)
  LibExampleTests.hx
  OtherExampleTests.hx
build.hxml                  # multi-target build (shared opts + --each/--next)
targets/                    # one hxml per target (js, js-esm, cs, python, docs, gdscript)
test.hxml                   # test build (libs/targets only — no -main)
.dropecho.testing.json      # test-runner config (coverage, root_package, hxml)
.haxerc                     # lix: pinned Haxe version + scoped lib resolution
haxe_libraries/             # lix: one hxml per pinned dep (some carry manual macro/-D lines — keep them when re-pinning)
dist/                       # compiled output
artifacts/                  # compiled test output + coverage reports
```

There is no hand-written test main/suite: `dropecho.testing` generates the entry point and
registers every `*Tests.hx` class on the classpath (note the plural — `Test.hx` files are
**not** discovered).

---

## Build & Test

Prefer `npm` scripts over invoking Haxe tools directly.

```bash
npm install      # → lix download   (fetch the pinned Haxe + libs into the lix cache)
npm run build    # → haxe build.hxml   (JS cjs + JS esm + C#)
npm test         # → lix dropecho.testing
npm run clean    # remove dist/ and artifacts/
```

`npm install` runs `lix download` (via the `prepare` lifecycle script) to materialize the deps pinned
in `.haxerc` + `haxe_libraries/`. To add a dependency, run `lix install haxelib:<name>` (or
`lix install gh:<owner>/<repo>` for a git lib) — lix writes its pinned `haxe_libraries/<name>.hxml`
— then add a matching `-lib <name>` to `build.hxml`/`test.hxml`. Commit the generated hxml.

- `build.hxml` puts shared options (class path, `--macro include`, `-D analyzer-optimize`,
  library deps) before `--each`, then builds each `targets/*.hxml` separated by `--next`.
- `test.hxml` lists libs/targets only — **no `-main`**. The `dropecho.testing` runner injects
  `--main dropecho.testing.AutoTest` (plus instrument/coverage from `.dropecho.testing.json`),
  then builds and runs the suite on every target in the hxml: **JS (Node) and Python**.
  gdscript and docs are not included — they are not runnable test programs — and js-esm would
  just re-run the JS suite.
- A **C#** test run is present but commented out in `test.hxml`. It builds and passes under
  `mono artifacts/cs_test/bin/AutoTest.exe`, but the runner execs the built `.exe` directly, so
  it needs `mono` registered for `.exe` (Windows, or Linux with a `binfmt_misc` mono entry).
  Uncomment the C# block where that is set up.

To type-check quickly without generating output: `haxe build.hxml --no-output`.

---

## Key Conventions

- `@:expose("Name")` on each public class sets its JavaScript export name (independent of the
  Haxe package). Use it on the classes you want in the JS bundle.
- Give every public function a full doc comment with `@param`/`@return`.
- Tests are `utest` cases: each class is named `*Tests.hx`, `extends utest.Test`, with
  `test_`-prefixed methods using `utest.Assert` (use `Assert.floatEquals` for floats).
