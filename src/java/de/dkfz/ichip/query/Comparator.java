/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

import java.net.URI;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Simple enum-class that holds all supported comparators for EavConditions
 *
 * @author kabbe
 *
 */
public enum Comparator {
    /**
     * equals
     */
    EQ(" = ", "equals"),
    /**
     * greater than
     */
    GT(" > ", "is greater than"),
    /**
     * less than
     */
    LT(" < ", "is less than"),
    /**
     * greater or equals
     */
    GE(" >= ", "is greater or equal to"),
    /**
     * less or equal
     */
    LE(" <= ", "is less or equal to"),
    /**
     * not equal
     */
    NE(" != ", "is not equal to"),
    /**
     * like
     */
    LK(" ilike ", "is like"),
    /**
     * note like
     */
    NL(" not ilike ", "is not like"),
    /**
     * is null
     */
    IN(" is null ", "is null", true),
    /**
     * is not null
     */
    NN(" is not null ", "is not null", true),
    ;

    private String sqlToken;

    private String humanReadable;

    private boolean unary = false;

    Comparator(String token, String readable) {
        this.sqlToken = token;
        this.humanReadable = readable;
    }

    Comparator(String token, String readable, boolean unary) {
        this(token, readable);
        this.unary = unary;
    }

    /**
     * returns sql-token that can be pasted into hql-queries
     *
     * @return sql-token
     */
    public String getSqlToken() {
        return this.sqlToken;
    }

    /**
     * @return the human readable form of the comparator
     */
    public String getHumanReadable() {
        return humanReadable;
    }

    /**
     * @return true if the comparator is unary and doesn't need a value to be
     *         applied on (e.g. is [not] null)
     */
    public boolean isUnary() {
        return unary;
    }

    public String asString() {
        return String.valueOf(this);
    }

    public String getAsString() {
        return String.valueOf(this);
    }

    public Comparator getAsEnum(String element) {
        return Comparator.valueOf(element);
    }

    public List<Comparator> asList() {
        List<Comparator> list = new ArrayList<Comparator>();
        for (Comparator c : Comparator.values()) {
            list.add(c);
        }

        return list;
    }


    /**
     * <p>this interface is supposed to be used in DomObjectConditoins;
     * <p>in this case one has to extend xml-framework with converter for Class<IComparator<?>>;
     * <p>because of the time pressure it is postponed;
     *
     * @author komardin
     *
     * @param <T>
     */
    public interface IComparator<T>
    {
        /**
         * returns sql-token that can be pasted into hql-queries
         *
         * @return sql-token
         */
        public String getSqlToken();

        /**
         * @return the human readable form of the comparator
         */
        public String getHumanReadable();

        /**
         * @return true if the comparator is unary and doesn't need a value to be
         *         applied on (e.g. is [not] null)
         */
        public boolean isUnary();

        public Comparator getComparator();

        public IComparator<T> getByValue(String value);
    }

    public enum StringComparator implements IComparator<String>
    {
        EQ(Comparator.EQ),
        NE(Comparator.NE),
        LK(Comparator.LK),
        NL(Comparator.NL),
        IN(Comparator.IN),
        NN(Comparator.NN);

        public String getHumanReadable() {
            return comparator.humanReadable;
        }

        public String getSqlToken() {
            return comparator.getSqlToken();
        }

        public boolean isUnary() {
            return comparator.isUnary();
        }

        public Comparator getComparator() {
            return this.comparator;
        }

        public IComparator<String> getByValue(String value) {
            return StringComparator.valueOf(value);
        }

        private Comparator comparator;

        private StringComparator(Comparator comparator)
        {
            this.comparator = comparator;
        }
    }



    public enum FloatComparator implements IComparator<Float>
    {
        EQ(Comparator.EQ),
        NE(Comparator.NE),
        GT(Comparator.GT),
        LT(Comparator.LT),
        GE(Comparator.GE),
        LE(Comparator.LE),
        IN(Comparator.IN),
        NN(Comparator.NN);

        public String getHumanReadable() {
            return comparator.humanReadable;
        }

        public String getSqlToken() {
            return comparator.getSqlToken();
        }

        public boolean isUnary() {
            return comparator.isUnary();
        }

        public Comparator getComparator() {
            return this.comparator;
        }

        public IComparator<Float> getByValue(String value) {
            return FloatComparator.valueOf(value);
        }

        private Comparator comparator;

        private FloatComparator(Comparator comparator)
        {
            this.comparator = comparator;
        }
    }

    public enum UriComparator implements IComparator<URI>
    {
        EQ(Comparator.EQ),
        NE(Comparator.NE),
        LK(Comparator.LK),
        NL(Comparator.NL),
        IN(Comparator.IN),
        NN(Comparator.NN);

        public String getHumanReadable() {
            return comparator.humanReadable;
        }

        public String getSqlToken() {
            return comparator.getSqlToken();
        }

        public boolean isUnary() {
            return comparator.isUnary();
        }

        public Comparator getComparator() {
            return this.comparator;
        }

        public IComparator<URI> getByValue(String value) {
            return UriComparator.valueOf(value);
        }

        private Comparator comparator;

        private UriComparator(Comparator comparator)
        {
            this.comparator = comparator;
        }
    }

    public enum DateComparator implements IComparator<Date>
    {
        EQ(Comparator.EQ),
        NE(Comparator.NE),
        GT(Comparator.GT),
        LT(Comparator.LT),
        GE(Comparator.GE),
        LE(Comparator.LE),
        IN(Comparator.IN),
        NN(Comparator.NN);

        public String getHumanReadable() {
            return comparator.getHumanReadable();
        }

        public String getSqlToken() {
            return comparator.getSqlToken();
        }

        public boolean isUnary() {
            return comparator.isUnary();
        }

        public Comparator getComparator() {
            return this.comparator;
        }

        public IComparator<Date> getByValue(String value) {
            return DateComparator.valueOf(value);
        }

        private Comparator comparator;

        private DateComparator(Comparator comparator)
        {
            this.comparator = comparator;
        }
    }

    private static List<Comparator> getStringUriComparators()
    {
        List<Comparator> list = new ArrayList<Comparator>();
        list.add(Comparator.NE);
        list.add(Comparator.LK);
        list.add(Comparator.NL);
        return list;
    }

    private static List<Comparator> getNumberComparators()
    {
        List<Comparator> list = new ArrayList<Comparator>();
        list.add(Comparator.NE);
        list.add(Comparator.GT);
        list.add(Comparator.LT);
        list.add(Comparator.GE);
        list.add(Comparator.LE);
        return list;
    }
}
