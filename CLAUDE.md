# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Superclass is a Dart code generation library that brings TypeScript Utility Types to Dart. It uses `build_runner` and `source_gen` to generate variations of existing types without manual duplication.

## Architecture

The project is a monorepo using Dart workspaces with two main packages:

- `packages/superclass/`: Core annotations package defining the TypeScript-like utility types
- `packages/superclass_generator/`: Code generator that processes the annotations

The generator creates `.superclass.dart` files and is configured to run before freezed and json_serializable generators for proper integration.

## Common Commands

### Build generated code
```bash
cd packages/superclass_generator/example
dart run build_runner build --delete-conflicting-outputs
```

### Run static analysis
```bash
cd packages/superclass_generator
dart analyze
```

### Install dependencies
```bash
dart pub get
```

## Key Features

The library provides TypeScript-like utility type annotations:
- `Merge<T1, T2>`: Merge two types together
- `Omit<T>`: Create a type with specific fields omitted
- `MakePartial<T>`: Make all fields optional or specific fields via `onlyFields`
- `Pick<T>`: Create a type with only specific fields
- `MakeRequired<T>`: Make all fields required or specific fields via `onlyFields`
- `Rename<T>`: Rename fields using a mapping for API compatibility
- `Intersect<T1, T2>`: Keep only fields that exist in both types
- `Diff<T1, T2>`: Keep fields that exist in T1 but not in T2
- `Transform<T>`: Transform field types using a mapping for serialization
- `WithDefaults<T>`: Add default values to fields (automatically handles Freezed @Default() annotations)
- `$PR` (Previous Result): Special type for chaining operations in the `apply` list

### Operation Chaining with $PR

The `$PR` type allows chaining multiple transformations where each operation works on the result of the previous one:

```dart
@Superclass(
  apply: [
    Omit<User>(fields: {'email'}),     // Step 1: Remove email field
    MakePartial<$PR>(),                 // Step 2: Make remaining fields optional
    Merge<$PR, Address>(),              // Step 3: Add address fields
  ],
)
typedef UserForm = $UserForm;
```

## Generator Architecture

The main generator logic is in `packages/superclass_generator/lib/src/generator.dart`. It:
1. Processes `@Superclass` annotations on typedefs
2. Applies the specified utility type modifiers (in `lib/src/modifiers/`)
3. Generates new Dart classes with the transformed fields
4. Optionally includes Freezed and JSON serialization support

## Development Notes

- The generator uses the analyzer package's AST to process type information
- Build configuration is in `packages/superclass_generator/build.yaml`
- The project currently has analyzer deprecation warnings that should be addressed by migrating to the new element model
- No tests are currently implemented despite test infrastructure being set up
- Comprehensive documentation with $PR examples is in `packages/superclass/README.md`
- Working examples demonstrating $PR chaining are in `packages/superclass_generator/example/lib/example.dart`

## $PR Implementation Details

The `$PR` class is defined in `packages/superclass/lib/superclass.dart` as a simple marker type. The generator recognizes when a type parameter is `$PR` and substitutes it with the fields from the previous transformation in the chain. This is handled in `packages/superclass_generator/lib/src/utils/helpers.dart` where the `ClassElementExtension.validMappedFieldsOrFields` method checks if the class name is `$PR` and returns the accumulated fields instead of the class's own fields.
