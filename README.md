> **gpu-eda provenance fork.** A patched YoWASP Yosys that preserves Yosys
> `(* src *)` RTL-source provenance through std-cell mapping (forked yosys + abc
> `&origins`, mapped via `abc_new`) so the [Jacquard](https://github.com/gpu-eda/Jacquard)
> RTL on-ramp can emit source-annotated waveforms (ADR 0021 Phase 2). The
> `yowasp-yosys-integration` branch and its `provenance-wasm` CI build, validate,
> and release the `yosys.wasm` that `jacquard` fetches. Tracks upstream
> [YoWASP/yosys](https://github.com/YoWASP/yosys); the only delta is the pinned
> `yosys-src` fork. The unmodified upstream README follows.

YoWASP Yosys packages
=====================

This package provides [Yosys][] binaries built for [WebAssembly][]. See the [overview of the YoWASP project][yowasp] for details.

Two embeddings are provided: [Python](pypi/README.md) and [JavaScript](npmjs/README.md).

[yosys]: https://github.com/YosysHQ/yosys/
[webassembly]: https://webassembly.org/
[yowasp]: https://yowasp.github.io/


License
-------

This package is covered by the [ISC license](LICENSE.txt), which is the same as the [Yosys license](https://github.com/YosysHQ/yosys/blob/master/COPYING).
