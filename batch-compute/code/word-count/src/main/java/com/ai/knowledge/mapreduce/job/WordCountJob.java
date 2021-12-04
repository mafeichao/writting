package com.ai.knowledge.mapreduce.job;

import com.ai.knowledge.mapreduce.mapper.WordCountMapper;
import com.ai.knowledge.mapreduce.reducer.WordCountReducer;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import java.io.IOException;

/**
 * @author mafeichao
 */
public class WordCountJob {
    public static void main(String[] args) {
        try {
            Configuration conf = new Configuration();
            Job job = null;
            job = Job.getInstance(conf, "word_count");
            job.setJarByClass(WordCountJob.class);
            job.setMapperClass(WordCountMapper.class);
            job.setCombinerClass(WordCountReducer.class);
            job.setReducerClass(WordCountReducer.class);
            FileInputFormat.addInputPath(job, new Path(args[0]));
            FileOutputFormat.setOutputPath(job, new Path(args[1]));
            job.waitForCompletion(true);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
