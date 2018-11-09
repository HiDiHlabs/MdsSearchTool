/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.util;

import java.util.ArrayList;
import java.util.List;

public class TreeNode<T> {

    public TreeNode(T data) {
        this.data = data;
        this.children = new ArrayList<TreeNode<T>>();
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public TreeNode<T> getParent() {
        return parent;
    }

    void setParent(TreeNode<T> parent) {
        this.parent = parent;
    }

    public List<TreeNode<T>> getChildren() {
        return new ArrayList<TreeNode<T>>(children);
    }

    public void addChild(TreeNode<T> child) {
        if(!this.children.contains(child)) {
            this.children.add(child);
            child.setParent(this);
        }
    }

    private T data;
    private TreeNode<T> parent;
    private List<TreeNode<T>> children;
}
