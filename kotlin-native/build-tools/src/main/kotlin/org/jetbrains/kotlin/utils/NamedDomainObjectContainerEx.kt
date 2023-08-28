/*
 * Copyright 2010-2023 JetBrains s.r.o. and Kotlin Programming Language contributors.
 * Use of this source code is governed by the Apache 2.0 license that can be found in the license/LICENSE.txt file.
 */

package org.jetbrains.kotlin.utils

import org.gradle.api.Action
import org.gradle.api.InvalidUserDataException
import org.gradle.api.NamedDomainObjectContainer

/**
 * Adds new object named [name] and configure it with [action] or return already existing object with this name.
 *
 * Similar to [NamedDomainObjectContainer.maybeCreate] but with [action] argument that will be applied only if
 * an object is being created.
 */
fun <T> NamedDomainObjectContainer<T>.getOrCreate(name: String, action: Action<in T>): T = try {
    this.create(name, action)
} catch (e: InvalidUserDataException) {
    this.getByName(name)
}