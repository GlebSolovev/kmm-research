/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.analysis.api.standalone.fir.test.cases.generated.cases.components.scopeProvider;

import com.intellij.testFramework.TestDataPath;
import org.jetbrains.kotlin.test.util.KtTestUtil;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.kotlin.analysis.api.standalone.fir.test.AnalysisApiFirStandaloneModeTestConfiguratorFactory;
import org.jetbrains.kotlin.analysis.test.framework.test.configurators.AnalysisApiTestConfiguratorFactoryData;
import org.jetbrains.kotlin.analysis.test.framework.test.configurators.AnalysisApiTestConfigurator;
import org.jetbrains.kotlin.analysis.test.framework.test.configurators.TestModuleKind;
import org.jetbrains.kotlin.analysis.test.framework.test.configurators.FrontendKind;
import org.jetbrains.kotlin.analysis.test.framework.test.configurators.AnalysisSessionMode;
import org.jetbrains.kotlin.analysis.test.framework.test.configurators.AnalysisApiMode;
import org.jetbrains.kotlin.analysis.api.impl.base.test.cases.components.scopeProvider.AbstractDeclaredMemberScopeTest;
import org.jetbrains.kotlin.test.TestMetadata;
import org.junit.jupiter.api.Nested;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.regex.Pattern;

/** This class is generated by {@link org.jetbrains.kotlin.generators.tests.analysis.api.GenerateAnalysisApiTestsKt}. DO NOT MODIFY MANUALLY */
@SuppressWarnings("all")
@TestMetadata("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope")
@TestDataPath("$PROJECT_ROOT")
public class FirStandaloneNormalAnalysisSourceModuleDeclaredMemberScopeTestGenerated extends AbstractDeclaredMemberScopeTest {
    @NotNull
    @Override
    public AnalysisApiTestConfigurator getConfigurator() {
        return AnalysisApiFirStandaloneModeTestConfiguratorFactory.INSTANCE.createConfigurator(
            new AnalysisApiTestConfiguratorFactoryData(
                FrontendKind.Fir,
                TestModuleKind.Source,
                AnalysisSessionMode.Normal,
                AnalysisApiMode.Standalone
            )
        );
    }

    @Test
    public void testAllFilesPresentInDeclaredMemberScope() throws Exception {
        KtTestUtil.assertAllTestsPresentByMetadataWithExcluded(this.getClass(), new File("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope"), Pattern.compile("^(.+)\\.kt$"), null, true);
    }

    @Test
    @TestMetadata("enumEntryInitializer.kt")
    public void testEnumEntryInitializer() throws Exception {
        runTest("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope/enumEntryInitializer.kt");
    }

    @Test
    @TestMetadata("enumEntryInitializerWithFinalEnumMember.kt")
    public void testEnumEntryInitializerWithFinalEnumMember() throws Exception {
        runTest("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope/enumEntryInitializerWithFinalEnumMember.kt");
    }

    @Test
    @TestMetadata("enumEntryInitializerWithOverriddenMember.kt")
    public void testEnumEntryInitializerWithOverriddenMember() throws Exception {
        runTest("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope/enumEntryInitializerWithOverriddenMember.kt");
    }

    @Test
    @TestMetadata("javaDeclaredEnhancementScope.kt")
    public void testJavaDeclaredEnhancementScope() throws Exception {
        runTest("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope/javaDeclaredEnhancementScope.kt");
    }

    @Test
    @TestMetadata("javaDeclaredInheritList.kt")
    public void testJavaDeclaredInheritList() throws Exception {
        runTest("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope/javaDeclaredInheritList.kt");
    }

    @Test
    @TestMetadata("javaInnerClassConstructor.kt")
    public void testJavaInnerClassConstructor() throws Exception {
        runTest("analysis/analysis-api/testData/components/scopeProvider/declaredMemberScope/javaInnerClassConstructor.kt");
    }
}
