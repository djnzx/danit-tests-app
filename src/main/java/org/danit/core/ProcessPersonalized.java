package org.danit.core;

import org.danit.core.stat.Statistics;
import org.danit.core.stat.StatisticsPersonalized;
import org.danit.logic.Persistence;
import org.danit.model.dao.DAOPgAnswer;
import org.danit.model.dao.DAOPgProcess;
import org.danit.model.dao.DAOPgQuestion;
import org.danit.model.dto.*;
import org.danit.model.dto.Process;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public final class ProcessPersonalized implements LearningProcess {
    private final Persistence persistence;
    private final int userId;
    private final Iterator<Integer> it;
    private final User user;
    private final Group group;
    private final AtomicInteger remained;

    /**
     * magic user_id (table `user` field `u_id`) who can mark and correct right answers
     */
    private final static int ADMIN_ID = -13;

    static Logger log = LoggerFactory.getLogger(ProcessPersonalized.class);

    public ProcessPersonalized(Persistence persistence, int id) {
        this.persistence=persistence;
        this.userId = id;
        DAOPgQuestion dao = this.persistence.get(Question.class).dao();
        List<Integer> available = dao.availableToUser(id);
        log.info(available.toString());
        this.it = available.iterator();
        this.remained = new AtomicInteger(available.size());
        this.user = (User) persistence.get(User.class).dao().get(id);
        this.group = (Group) persistence.get(Group.class).dao().get(user.getGroupId());
    }

    @Override
    public Statistics statistics() {
        return new StatisticsPersonalized(this.userId);
    }

    @Override
    public void skip(int qid) {
        DAOPgProcess dao = persistence.get(Process.class).dao();
        dao.insert(new org.danit.model.dto.Process(this.userId, qid, 0));
    }

    @Override
    public void store(int question, int answer) {
        if (userId == ADMIN_ID) {
            DAOPgAnswer aw = persistence.get(Answer.class).dao();
            aw.markRightAnswer(answer);
        }
        DAOPgProcess dao = persistence.get(Process.class).dao();
        dao.insert(new org.danit.model.dto.Process(this.userId, question, answer));
        remained.decrementAndGet();
    }

    @Override
    public OneQuestion next() {
        return new OneQuestion(persistence, it.next());
    }

    @Override
    public boolean hasNext() {
        return it.hasNext();
    }

    public User user() {
        return user;
    }

    public Group group() {
        return group;
    }

    public int remained() {
        return remained.get();
    }
}
