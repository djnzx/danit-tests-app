package org.danit.core;

import org.alexr.colored.Attribute;
import org.alexr.colored.Colored;
import org.danit.core.stat.Statistics;
import org.danit.core.stat.StatisticsPersonalized;
import org.danit.logic.Persistence;
import org.danit.model.dao.DAOPgProcess;
import org.danit.model.dao.DAOPgQuestion;
import org.danit.model.dto.Group;
import org.danit.model.dto.Question;
import org.danit.model.dto.User;
import org.danit.model.dto.Process;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Iterator;
import java.util.List;

public class ProcessPersonalized implements LearningProcess {
    private final Persistence persistence;
    private final int userId;
    private final Iterator<Integer> it;
    private final User user;
    private final Group group;

    static Logger log = LoggerFactory.getLogger(ProcessPersonalized.class);

    public ProcessPersonalized(Persistence persistence, int id) {
        this.persistence=persistence;
        this.userId = id;
        DAOPgQuestion dao = this.persistence.get(Question.class).dao();
        List<Integer> available = dao.availableByUser(id);
        log.info(available.toString());
        this.it = available.iterator();
        this.user = (User) persistence.get(User.class).dao().get(id);
        this.group = (Group) persistence.get(Group.class).dao().get(user.getGroupId());
    }

    @Override
    public Statistics statistics() {
        return new StatisticsPersonalized(this.userId);
    }

    @Override
    public void skip(int qid) {
        log.info(Colored.build("id1:"+qid, Attribute.MAGENTA));
        DAOPgProcess dao = persistence.get(Process.class).dao();
        log.info(Colored.build("id2:"+qid, Attribute.MAGENTA));
        dao.insert(new org.danit.model.dto.Process(this.userId, qid, 0));
        log.info(Colored.build("id3:"+qid, Attribute.MAGENTA));
    }

    @Override
    public void store(int question, int answer) {
        DAOPgProcess dao = persistence.get(Process.class).dao();
        dao.insert(new org.danit.model.dto.Process(this.userId, question, answer));
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
}
