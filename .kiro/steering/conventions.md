# 代码规范与约定

## 代码风格

Nacos 项目遵循**阿里巴巴 Java 开发规约**和社区定制的代码风格。

### 规范文档

- [Alibaba Java Coding Guidelines（英文）](https://alibaba.github.io/Alibaba-Java-Coding-Guidelines/)
- [阿里巴巴 Java 开发手册（中文 PDF）](https://github.com/alibaba/p3c/blob/master/%E9%98%BF%E9%87%8C%E5%B7%B4%E5%B7%B4Java%E5%BC%80%E5%8F%91%E6%89%8B%E5%86%8C%EF%BC%88%E5%8D%8E%E5%B1%B1%E7%89%88%EF%BC%89.pdf)

### IDE 配置

#### IntelliJ IDEA

1. **导入代码风格**：
   - 文件位置：`style/nacos-code-style-for-idea.xml`
   - 导入路径：`Preferences/Settings → Editor → Code Style → Schema → Import Schema → IntelliJ IDEA code style XML`

2. **安装 Checkstyle 插件**：
   - 插件：[CheckStyle-IDEA](https://plugins.jetbrains.com/plugin/1065-checkstyle-idea)
   - 配置路径：`Preferences/Settings → Tools → Checkstyle`
   - Checkstyle 版本：至少 8.30
   - 扫描范围：`All resource (including tests)`
   - 配置文件：`style/NacosCheckStyle.xml`（或 `NacosCheckStyle_9.xml` 用于新版本）

3. **安装 P3C 插件**（可选）：
   - 插件：[Alibaba Java Coding Guidelines](https://github.com/alibaba/p3c/blob/master/idea-plugin/README_cn.md)
   - 用于实时发现代码问题

## 构建检查

项目在构建时会自动执行以下检查：

### Maven 插件检查

- **Checkstyle**：代码风格检查（`maven-checkstyle-plugin`）
- **PMD**：代码质量检查，使用阿里巴巴 P3C 规则（`maven-pmd-plugin`）
- **Apache RAT**：许可证头检查（`apache-rat-plugin`）

### 排除的文件

以下文件/目录会被检查工具排除：
- `**/consistency/entity/**` - 生成的实体类
- `**/api/grpc/auto/**` - gRPC 自动生成代码
- `**/istio/**` - Istio 相关代码
- `**/protobuf/**` - Protocol Buffers 生成代码
- `**/packagescan/**` - 包扫描工具类

## 贡献流程

### 分支模型

- **develop**：开发分支（不稳定）
- 遵循 [Git Flow 分支模型](https://nvie.com/posts/a-successful-git-branching-model/)

### Pull Request 要求

1. **关联 Issue**：每个 PR 必须关联一个有效的 Issue
2. **目标分支**：PR 必须提交到 `develop` 分支
3. **代码质量**：
   - 重要代码需要有良好的文档和 Javadoc
   - 遵循现有代码风格
   - 新代码需要 80% 以上的单元测试覆盖率
4. **提交信息**：提交信息应简洁明确
5. **代码审查**：至少需要一位 Committer 审查通过

### 适合新手的 Issue 标签

- `good first issue`：适合新手入门
- `contribution welcome`：急需帮助的问题

## 前端规范 (console-ui)

### 代码检查

- **ESLint**：使用阿里巴巴配置（`eslint-config-ali`）
- **Prettier**：代码格式化
- **Git Hooks**：提交前自动格式化（Husky + lint-staged）

### 运行检查

```bash
# 运行 ESLint 检查
npm run eslint

# 自动修复问题
npm run eslint-fix
```

## 许可证

所有源代码文件必须包含 Apache License 2.0 许可证头：

```java
/*
 * Copyright 1999-2024 Alibaba Group Holding Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
```
