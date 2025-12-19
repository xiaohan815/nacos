# Project Structure

The project uses a multi-module Maven structure with the following main modules:

## Core Modules

- **api**: Public API definitions and gRPC service definitions
- **client**: Client SDK for service discovery and configuration
- **common**: Common utilities and shared code
- **config**: Configuration management module
- **naming**: Service discovery and registration module
- **core**: Core server functionality
- **console**: Backend for web console
- **console-ui**: Frontend React application for web console

## Supporting Modules

- **auth**: Authentication and authorization
- **persistence**: Data persistence layer
- **consistency**: Distributed consistency (Raft implementation)
- **plugin**: Plugin interfaces
- **plugin-default-impl**: Default plugin implementations
- **sys**: System management
- **istio**: Istio integration
- **prometheus**: Prometheus metrics integration
- **cmdb**: CMDB integration
- **address**: Address server module

## Testing Modules

- **test**: Integration tests
  - **config-test**: Configuration integration tests
  - **core-test**: Core integration tests
  - **naming-test**: Naming integration tests
- **example**: Example code and usage demonstrations

## Frontend Structure (console-ui)

```
console-ui/
├── src/
│   ├── components/     # Reusable React components
│   ├── pages/          # Page-level components
│   │   ├── AuthorityControl/
│   │   ├── ClusterManagement/
│   │   ├── ConfigurationManagement/
│   │   ├── ServiceManagement/
│   │   ├── Login/
│   │   └── NameSpace/
│   ├── reducers/       # Redux reducers
│   ├── layouts/        # Layout components
│   ├── locales/        # i18n translations (zh-CN, en-US)
│   └── utils/          # Utility functions
├── build/              # Webpack build configuration
└── public/             # Static assets
```

## Backend Package Structure

All Java packages follow the pattern: `com.alibaba.nacos.<module>.*`

Common package patterns:
- `*.api`: Public APIs and interfaces
- `*.controller`: REST API controllers
- `*.service`: Business logic services
- `*.model` / `*.entity`: Data models
- `*.config`: Configuration classes
- `*.utils`: Utility classes

## Configuration Files

- **pom.xml**: Maven project configuration (root and per-module)
- **application.properties**: Spring Boot application configuration
- **style/**: Code style and checkstyle configurations
  - `nacos-code-style-for-idea.xml`: IntelliJ IDEA code style
  - `NacosCheckStyle.xml`: Checkstyle rules
