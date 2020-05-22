package by.bsuir.repository.filter;

import by.bsuir.entity.Flat;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.domain.Specifications;

import javax.persistence.criteria.Path;
import javax.persistence.criteria.Predicate;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FlatFilter {

    private final static int TODAY = 1;
    private final static int DAYS_3 = 3;
    private final static int WEEK = 7;
    private final static int MONTH = 31;

    private FlatFilter(){}

    public static Specifications filterByAllParam(int idArea, int priceFrom, int priceTo, int[] amountRoom, int date){
        return Specifications
                .where(filterByArea(idArea))
                .and(filterByPrice(priceFrom, priceTo))
                .and(filterByAmountRoom(amountRoom))
                .and(filterByDate(date)).and(ByStatus("free"));
    }

    public static Specifications filterByStatus(String status){
        return Specifications.where(ByStatus(status));
    }

    private static Specification<Flat> ByStatus(String status) {
        return ((root, query, cb) -> {
            if (null != status) {
                return cb.like(root.get("status").get("type"), status);
            }
            return cb.isNotNull(root.get("status"));
        });
    }

    private static Specification<Flat> filterByArea(int idArea) {
        return (root, query, cb) -> {
            if (0 != idArea) {
                return cb.equal(root.get("address").get("area").get("id"), idArea);
            } else {
                return cb.isNotNull(root.get("address").get("id"));
            }

        };
    }


    private static Specification<Flat> filterByPrice(int priceFrom, int priceTo) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (0 != priceFrom) {
                predicates.add(cb.ge(root.get("monthPrice"), priceFrom));
            } else {
                predicates.add(cb.ge(root.get("monthPrice"), 0));
            }
            if (0 != priceTo) {
                predicates.add(cb.le(root.get("monthPrice"), priceTo));
            }
            return cb.and(predicates.toArray(new Predicate[0]));
        };
    }

    private static Specification<Flat> filterByAmountRoom(int[] amountRoom) {
        return (root, query, cb) -> {
            List<Predicate> predicates = new ArrayList<>();
            if (null != amountRoom) {
                for (Integer i: amountRoom) {
                    predicates.add(cb.equal(root.<Integer>get("amountRoom"), i));
                }
                return cb.or(predicates.toArray(new Predicate[0]));
            } else {
                return (cb.ge(root.<Integer>get("amountRoom"), 1));
            }
        };
    }

    private static Specification<Flat> filterByDate(int date) {
        return (root, query, cb) -> {
            Path<Date> uploadDate = root.get("uploadDate");
            LocalDate currentDate = LocalDate.now();
            Predicate predicate;
            switch (date) {
                case TODAY:
                    predicate = cb.equal(uploadDate, java.sql.Date.valueOf(currentDate));
                    break;
                case DAYS_3:
                    predicate = cb.between(uploadDate, java.sql.Date.valueOf(currentDate.minus(Period.ofDays(DAYS_3))),
                            java.sql.Date.valueOf(currentDate));
                    break;
                case WEEK:
                    predicate = cb.between(uploadDate, java.sql.Date.valueOf(currentDate.minus(Period.ofDays(WEEK))),
                            java.sql.Date.valueOf(currentDate));
                    break;
                case MONTH:
                    predicate = cb.between(uploadDate, java.sql.Date.valueOf(currentDate.minus(Period.ofDays(MONTH))),
                            java.sql.Date.valueOf(currentDate));
                    break;
                default:
                    predicate = cb.isNotNull(root.get("uploadDate"));
            }
            return predicate;
        };
    }
}
