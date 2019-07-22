// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package eu.stamp.camp.samples.testman.domain;

import eu.stamp.camp.samples.testman.domain.TCExecution;
import eu.stamp.camp.samples.testman.domain.TCExecutionDataOnDemand;
import eu.stamp.camp.samples.testman.domain.TCExecutionIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TCExecutionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TCExecutionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TCExecutionIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: TCExecutionIntegrationTest: @Transactional;
    
    @Autowired
    TCExecutionDataOnDemand TCExecutionIntegrationTest.dod;
    
    @Test
    public void TCExecutionIntegrationTest.testCountTCExecutions() {
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", dod.getRandomTCExecution());
        long count = TCExecution.countTCExecutions();
        Assert.assertTrue("Counter for 'TCExecution' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TCExecutionIntegrationTest.testFindTCExecution() {
        TCExecution obj = dod.getRandomTCExecution();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to provide an identifier", id);
        obj = TCExecution.findTCExecution(id);
        Assert.assertNotNull("Find method for 'TCExecution' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'TCExecution' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TCExecutionIntegrationTest.testFindAllTCExecutions() {
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", dod.getRandomTCExecution());
        long count = TCExecution.countTCExecutions();
        Assert.assertTrue("Too expensive to perform a find all test for 'TCExecution', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<TCExecution> result = TCExecution.findAllTCExecutions();
        Assert.assertNotNull("Find all method for 'TCExecution' illegally returned null", result);
        Assert.assertTrue("Find all method for 'TCExecution' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TCExecutionIntegrationTest.testFindTCExecutionEntries() {
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", dod.getRandomTCExecution());
        long count = TCExecution.countTCExecutions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<TCExecution> result = TCExecution.findTCExecutionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'TCExecution' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'TCExecution' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TCExecutionIntegrationTest.testFlush() {
        TCExecution obj = dod.getRandomTCExecution();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to provide an identifier", id);
        obj = TCExecution.findTCExecution(id);
        Assert.assertNotNull("Find method for 'TCExecution' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTCExecution(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'TCExecution' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TCExecutionIntegrationTest.testMergeUpdate() {
        TCExecution obj = dod.getRandomTCExecution();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to provide an identifier", id);
        obj = TCExecution.findTCExecution(id);
        boolean modified =  dod.modifyTCExecution(obj);
        Integer currentVersion = obj.getVersion();
        TCExecution merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'TCExecution' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TCExecutionIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", dod.getRandomTCExecution());
        TCExecution obj = dod.getNewTransientTCExecution(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'TCExecution' identifier to be null", obj.getId());
        try {
            obj.persist();
        } catch (final ConstraintViolationException e) {
            final StringBuilder msg = new StringBuilder();
            for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                final ConstraintViolation<?> cv = iter.next();
                msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
            }
            throw new IllegalStateException(msg.toString(), e);
        }
        obj.flush();
        Assert.assertNotNull("Expected 'TCExecution' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TCExecutionIntegrationTest.testRemove() {
        TCExecution obj = dod.getRandomTCExecution();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'TCExecution' failed to provide an identifier", id);
        obj = TCExecution.findTCExecution(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'TCExecution' with identifier '" + id + "'", TCExecution.findTCExecution(id));
    }
    
}
