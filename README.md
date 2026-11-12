# TernLib
![Release](https://img.shields.io/badge/release-v0.4.2-0078D4)
![Language](https://img.shields.io/badge/language%20-%20Zig-orange)
![License](https://img.shields.io/github/license/lina-torovoltas/TernLib)
![GitHub last commit](https://img.shields.io/github/last-commit/lina-torovoltas/TernLib)</br>


### Was ist das???

TernLib is a library that provides balanced ternary logic operations (e.g. `min`, `max`, `webb`, `neg`)</br>
and ternary data types represented using binary bit planes (e.g. `Trit`, `Tryte`, `Verbum`, `t27`).

### Wozu ist das???

To experiment with ternary logic in algorithms and programs,</br>
explore ternary computing, and, well... just for fun lol.

## Docs

Docs??? Who even reads docs???</br>
(hahaha, i'll add them later, just a placeholder for now)


## Installation

1. Add the dependency to your project:

```
zig fetch --save=ternlib git+https://github.com/lina-torovoltas/TernLib#main
```

2. Add the module to your `build.zig`:

```zig
const ternlib = b.dependency("ternlib", .{});
exe.root_module.addImport("ternlib", ternlib.module("ternlib"));
```

3. Import the library:

```zig
const tern = @import("ternlib");
```


## Contributing

Contributions are welcome!</br>
If thou hast found a bug or wish to propose an improvement,</br>
feel free to open an [issue](../../issues) or submit a [pull request](../../pulls).

***
Developed by <a href="https://lina-kiratorasu.codeberg.page/" style="color:#ff4f00">Lina Kiratorasu</a> (c) 2026-2027 (yeah, i'm in the future rn),</br>
released under the [MIT License](LICENSE).
