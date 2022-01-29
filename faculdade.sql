PGDMP                          z         	   faculdade #   12.9 (Ubuntu 12.9-0ubuntu0.20.04.1) #   12.9 (Ubuntu 12.9-0ubuntu0.20.04.1) A               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16393 	   faculdade    DATABASE     {   CREATE DATABASE faculdade WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';
    DROP DATABASE faculdade;
                postgres    false            �            1259    16437    alunos    TABLE     .  CREATE TABLE public.alunos (
    mat_alu integer NOT NULL,
    cod_curso integer NOT NULL,
    dat_nasc date NOT NULL,
    tot_cred integer NOT NULL,
    mgp double precision NOT NULL,
    nom_alu character varying(60) NOT NULL,
    email character varying(30),
    CONSTRAINT alunos_cod_curso_check CHECK ((cod_curso > 0)),
    CONSTRAINT alunos_mat_alu_check CHECK ((mat_alu > 0)),
    CONSTRAINT alunos_mgp_check CHECK (((mgp >= (0)::double precision) AND (mgp <= (10)::double precision))),
    CONSTRAINT alunos_tot_cred_check CHECK ((tot_cred >= 0))
);
    DROP TABLE public.alunos;
       public         heap    postgres    false            �            1259    16485 	   conceitos    TABLE     �  CREATE TABLE public.conceitos (
    conceito character(1) NOT NULL,
    faixa_ini double precision NOT NULL,
    faixa_fim double precision NOT NULL,
    CONSTRAINT conceitos_conceito_check CHECK ((conceito = ANY (ARRAY['A'::bpchar, 'B'::bpchar, 'C'::bpchar, 'D'::bpchar, 'E'::bpchar]))),
    CONSTRAINT conceitos_faixa_fim_check CHECK ((faixa_fim >= (0)::double precision)),
    CONSTRAINT conceitos_faixa_ini_check CHECK ((faixa_ini >= (0)::double precision))
);
    DROP TABLE public.conceitos;
       public         heap    postgres    false            �            1259    16429 
   curriculos    TABLE     Z  CREATE TABLE public.curriculos (
    cod_curso integer NOT NULL,
    cod_disc integer NOT NULL,
    periodo integer NOT NULL,
    CONSTRAINT curriculos_cod_curso_check CHECK ((cod_curso > 0)),
    CONSTRAINT curriculos_cod_disc_check CHECK ((cod_disc > 0)),
    CONSTRAINT curriculos_periodo_check CHECK (((periodo >= 1) AND (periodo <= 12)))
);
    DROP TABLE public.curriculos;
       public         heap    postgres    false            �            1259    16394    cursos    TABLE        CREATE TABLE public.cursos (
    cod_curso integer NOT NULL,
    tot_cred integer NOT NULL,
    nom_curso character varying(60) NOT NULL,
    cod_coord integer,
    CONSTRAINT cursos_cod_curso_check CHECK ((cod_curso > 0)),
    CONSTRAINT cursos_tot_cred_check CHECK ((tot_cred >= 0))
);
    DROP TABLE public.cursos;
       public         heap    postgres    false            �            1259    16410    disciplinas    TABLE     G  CREATE TABLE public.disciplinas (
    cod_disc integer NOT NULL,
    qtd_cred integer NOT NULL,
    nom_disc character varying(60) NOT NULL,
    cod_disc_equiv integer,
    CONSTRAINT disciplinas_cod_disc_check CHECK ((cod_disc > 0)),
    CONSTRAINT disciplinas_qtd_cred_check CHECK (((qtd_cred >= 1) AND (qtd_cred <= 36)))
);
    DROP TABLE public.disciplinas;
       public         heap    postgres    false            �            1259    16457    historicos_escolares    TABLE     �  CREATE TABLE public.historicos_escolares (
    ano integer NOT NULL,
    semestre integer NOT NULL,
    cod_disc integer NOT NULL,
    mat_alu integer NOT NULL,
    media double precision NOT NULL,
    faltas double precision NOT NULL,
    situacao character(2) NOT NULL,
    CONSTRAINT historicos_escolares_ano_check CHECK ((ano > 0)),
    CONSTRAINT historicos_escolares_cod_disc_check CHECK ((cod_disc > 0)),
    CONSTRAINT historicos_escolares_faltas_check CHECK ((faltas >= (0)::double precision)),
    CONSTRAINT historicos_escolares_mat_alu_check CHECK ((mat_alu > 0)),
    CONSTRAINT historicos_escolares_media_check CHECK (((media >= (0)::double precision) AND (media <= (10)::double precision))),
    CONSTRAINT historicos_escolares_semestre_check CHECK ((semestre = ANY (ARRAY[1, 2]))),
    CONSTRAINT historicos_escolares_situacao_check CHECK ((situacao = ANY (ARRAY['AP'::bpchar, 'RF'::bpchar, 'RM'::bpchar])))
);
 (   DROP TABLE public.historicos_escolares;
       public         heap    postgres    false            �            1259    16422    pre_requisitos    TABLE     �   CREATE TABLE public.pre_requisitos (
    cod_disc integer NOT NULL,
    cod_disc_pre integer NOT NULL,
    CONSTRAINT pre_requisitos_cod_disc_check CHECK ((cod_disc > 0)),
    CONSTRAINT pre_requisitos_cod_disc_pre_check CHECK ((cod_disc_pre > 0))
);
 "   DROP TABLE public.pre_requisitos;
       public         heap    postgres    false            �            1259    16403    professores    TABLE     7  CREATE TABLE public.professores (
    cod_prof integer NOT NULL,
    cod_curso integer NOT NULL,
    nom_prof character varying(60) NOT NULL,
    email character varying(30),
    CONSTRAINT professores_cod_curso_check CHECK ((cod_curso > 0)),
    CONSTRAINT professores_cod_prof_check CHECK ((cod_prof > 0))
);
    DROP TABLE public.professores;
       public         heap    postgres    false            �            1259    16446    turmas    TABLE     e  CREATE TABLE public.turmas (
    ano integer NOT NULL,
    semestre integer NOT NULL,
    cod_disc integer NOT NULL,
    turma character(3) NOT NULL,
    tot_vagas integer NOT NULL,
    vag_ocup integer NOT NULL,
    cod_prof integer,
    CONSTRAINT turmas_ano_check CHECK ((ano > 0)),
    CONSTRAINT turmas_cod_disc_check CHECK ((cod_disc > 0)),
    CONSTRAINT turmas_cod_prof_check CHECK ((cod_prof > 0)),
    CONSTRAINT turmas_semestre_check CHECK ((semestre = ANY (ARRAY[1, 2]))),
    CONSTRAINT turmas_tot_vagas_check CHECK ((tot_vagas >= 0)),
    CONSTRAINT turmas_vag_ocup_check CHECK ((vag_ocup >= 0))
);
    DROP TABLE public.turmas;
       public         heap    postgres    false            �            1259    16469    turmas_matriculadas    TABLE     �  CREATE TABLE public.turmas_matriculadas (
    ano integer NOT NULL,
    semestre integer NOT NULL,
    cod_disc integer NOT NULL,
    turma character(3) NOT NULL,
    mat_alu integer NOT NULL,
    nota_1 double precision,
    nota_2 double precision,
    nota_3 double precision,
    nota_4 double precision,
    faltas_1 integer,
    faltas_2 integer,
    faltas_3 integer,
    CONSTRAINT turmas_matriculadas_ano_check CHECK ((ano > 0)),
    CONSTRAINT turmas_matriculadas_cod_disc_check CHECK ((cod_disc > 0)),
    CONSTRAINT turmas_matriculadas_faltas_1_check CHECK ((faltas_1 >= 0)),
    CONSTRAINT turmas_matriculadas_faltas_2_check CHECK ((faltas_2 >= 0)),
    CONSTRAINT turmas_matriculadas_faltas_3_check CHECK ((faltas_3 >= 0)),
    CONSTRAINT turmas_matriculadas_mat_alu_check CHECK ((mat_alu > 0)),
    CONSTRAINT turmas_matriculadas_nota_1_check CHECK (((nota_1 >= (0)::double precision) AND (nota_1 <= (10)::double precision))),
    CONSTRAINT turmas_matriculadas_nota_2_check CHECK (((nota_2 >= (0)::double precision) AND (nota_2 <= (10)::double precision))),
    CONSTRAINT turmas_matriculadas_nota_3_check CHECK (((nota_3 >= (0)::double precision) AND (nota_3 <= (10)::double precision))),
    CONSTRAINT turmas_matriculadas_nota_4_check CHECK (((nota_4 >= (0)::double precision) AND (nota_4 <= (10)::double precision))),
    CONSTRAINT turmas_matriculadas_semestre_check CHECK ((semestre = ANY (ARRAY[1, 2])))
);
 '   DROP TABLE public.turmas_matriculadas;
       public         heap    postgres    false                      0    16437    alunos 
   TABLE DATA           ]   COPY public.alunos (mat_alu, cod_curso, dat_nasc, tot_cred, mgp, nom_alu, email) FROM stdin;
    public          postgres    false    207   4Z                 0    16485 	   conceitos 
   TABLE DATA           C   COPY public.conceitos (conceito, faixa_ini, faixa_fim) FROM stdin;
    public          postgres    false    211   �d                 0    16429 
   curriculos 
   TABLE DATA           B   COPY public.curriculos (cod_curso, cod_disc, periodo) FROM stdin;
    public          postgres    false    206   e                 0    16394    cursos 
   TABLE DATA           K   COPY public.cursos (cod_curso, tot_cred, nom_curso, cod_coord) FROM stdin;
    public          postgres    false    202   g                 0    16410    disciplinas 
   TABLE DATA           S   COPY public.disciplinas (cod_disc, qtd_cred, nom_disc, cod_disc_equiv) FROM stdin;
    public          postgres    false    204   g                 0    16457    historicos_escolares 
   TABLE DATA           i   COPY public.historicos_escolares (ano, semestre, cod_disc, mat_alu, media, faltas, situacao) FROM stdin;
    public          postgres    false    209   �m                 0    16422    pre_requisitos 
   TABLE DATA           @   COPY public.pre_requisitos (cod_disc, cod_disc_pre) FROM stdin;
    public          postgres    false    205   ��                 0    16403    professores 
   TABLE DATA           K   COPY public.professores (cod_prof, cod_curso, nom_prof, email) FROM stdin;
    public          postgres    false    203   B�                 0    16446    turmas 
   TABLE DATA           _   COPY public.turmas (ano, semestre, cod_disc, turma, tot_vagas, vag_ocup, cod_prof) FROM stdin;
    public          postgres    false    208   �                 0    16469    turmas_matriculadas 
   TABLE DATA           �   COPY public.turmas_matriculadas (ano, semestre, cod_disc, turma, mat_alu, nota_1, nota_2, nota_3, nota_4, faltas_1, faltas_2, faltas_3) FROM stdin;
    public          postgres    false    210   k�       u           2606    16445    alunos alu_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alu_pk PRIMARY KEY (mat_alu);
 7   ALTER TABLE ONLY public.alunos DROP CONSTRAINT alu_pk;
       public            postgres    false    207            �           2606    16492    conceitos con_pk 
   CONSTRAINT     T   ALTER TABLE ONLY public.conceitos
    ADD CONSTRAINT con_pk PRIMARY KEY (conceito);
 :   ALTER TABLE ONLY public.conceitos DROP CONSTRAINT con_pk;
       public            postgres    false    211            `           2606    16400    cursos crs_pk 
   CONSTRAINT     R   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT crs_pk PRIMARY KEY (cod_curso);
 7   ALTER TABLE ONLY public.cursos DROP CONSTRAINT crs_pk;
       public            postgres    false    202            b           2606    16402    cursos crs_uk 
   CONSTRAINT     M   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT crs_uk UNIQUE (cod_coord);
 7   ALTER TABLE ONLY public.cursos DROP CONSTRAINT crs_uk;
       public            postgres    false    202            r           2606    16436    curriculos cur_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.curriculos
    ADD CONSTRAINT cur_pk PRIMARY KEY (cod_curso, cod_disc);
 ;   ALTER TABLE ONLY public.curriculos DROP CONSTRAINT cur_pk;
       public            postgres    false    206    206            j           2606    16416    disciplinas dsc_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT dsc_pk PRIMARY KEY (cod_disc);
 <   ALTER TABLE ONLY public.disciplinas DROP CONSTRAINT dsc_pk;
       public            postgres    false    204            }           2606    16468    historicos_escolares hst_pk 
   CONSTRAINT     w   ALTER TABLE ONLY public.historicos_escolares
    ADD CONSTRAINT hst_pk PRIMARY KEY (ano, semestre, cod_disc, mat_alu);
 E   ALTER TABLE ONLY public.historicos_escolares DROP CONSTRAINT hst_pk;
       public            postgres    false    209    209    209    209            �           2606    16484    turmas_matriculadas mat_pk 
   CONSTRAINT     v   ALTER TABLE ONLY public.turmas_matriculadas
    ADD CONSTRAINT mat_pk PRIMARY KEY (ano, semestre, cod_disc, mat_alu);
 D   ALTER TABLE ONLY public.turmas_matriculadas DROP CONSTRAINT mat_pk;
       public            postgres    false    210    210    210    210            n           2606    16428    pre_requisitos pre_pk 
   CONSTRAINT     g   ALTER TABLE ONLY public.pre_requisitos
    ADD CONSTRAINT pre_pk PRIMARY KEY (cod_disc, cod_disc_pre);
 ?   ALTER TABLE ONLY public.pre_requisitos DROP CONSTRAINT pre_pk;
       public            postgres    false    205    205            f           2606    16409    professores prf_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.professores
    ADD CONSTRAINT prf_pk PRIMARY KEY (cod_prof);
 <   ALTER TABLE ONLY public.professores DROP CONSTRAINT prf_pk;
       public            postgres    false    203            x           2606    16456    turmas tur_pk 
   CONSTRAINT     g   ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT tur_pk PRIMARY KEY (ano, semestre, cod_disc, turma);
 7   ALTER TABLE ONLY public.turmas DROP CONSTRAINT tur_pk;
       public            postgres    false    208    208    208    208            s           1259    16566 	   alu_nom_i    INDEX     ?   CREATE INDEX alu_nom_i ON public.alunos USING btree (nom_alu);
    DROP INDEX public.alu_nom_i;
       public            postgres    false    207            g           1259    16573    cod_disc_equiv_i    INDEX     R   CREATE INDEX cod_disc_equiv_i ON public.disciplinas USING btree (cod_disc_equiv);
 $   DROP INDEX public.cod_disc_equiv_i;
       public            postgres    false    204            ^           1259    16558 	   crs_nom_i    INDEX     A   CREATE INDEX crs_nom_i ON public.cursos USING btree (nom_curso);
    DROP INDEX public.crs_nom_i;
       public            postgres    false    202            o           1259    16564 	   cur_crs_i    INDEX     E   CREATE INDEX cur_crs_i ON public.curriculos USING btree (cod_curso);
    DROP INDEX public.cur_crs_i;
       public            postgres    false    206            p           1259    16565 	   cur_dsc_i    INDEX     D   CREATE INDEX cur_dsc_i ON public.curriculos USING btree (cod_disc);
    DROP INDEX public.cur_dsc_i;
       public            postgres    false    206            h           1259    16561 	   dsc_nom_i    INDEX     E   CREATE INDEX dsc_nom_i ON public.disciplinas USING btree (nom_disc);
    DROP INDEX public.dsc_nom_i;
       public            postgres    false    204            z           1259    16570 	   hst_alu_i    INDEX     M   CREATE INDEX hst_alu_i ON public.historicos_escolares USING btree (mat_alu);
    DROP INDEX public.hst_alu_i;
       public            postgres    false    209            {           1259    16569 	   hst_dsc_i    INDEX     N   CREATE INDEX hst_dsc_i ON public.historicos_escolares USING btree (cod_disc);
    DROP INDEX public.hst_dsc_i;
       public            postgres    false    209            ~           1259    16571 	   mat_alu_i    INDEX     L   CREATE INDEX mat_alu_i ON public.turmas_matriculadas USING btree (mat_alu);
    DROP INDEX public.mat_alu_i;
       public            postgres    false    210            �           1259    16572 	   mat_tur_i    INDEX     c   CREATE INDEX mat_tur_i ON public.turmas_matriculadas USING btree (ano, semestre, cod_disc, turma);
    DROP INDEX public.mat_tur_i;
       public            postgres    false    210    210    210    210            k           1259    16562 	   pre_dsc_i    INDEX     H   CREATE INDEX pre_dsc_i ON public.pre_requisitos USING btree (cod_disc);
    DROP INDEX public.pre_dsc_i;
       public            postgres    false    205            l           1259    16563    pre_dsc_pre_i    INDEX     P   CREATE INDEX pre_dsc_pre_i ON public.pre_requisitos USING btree (cod_disc_pre);
 !   DROP INDEX public.pre_dsc_pre_i;
       public            postgres    false    205            c           1259    16559 	   prf_crs_i    INDEX     F   CREATE INDEX prf_crs_i ON public.professores USING btree (cod_curso);
    DROP INDEX public.prf_crs_i;
       public            postgres    false    203            d           1259    16560 	   prf_nom_i    INDEX     E   CREATE INDEX prf_nom_i ON public.professores USING btree (nom_prof);
    DROP INDEX public.prf_nom_i;
       public            postgres    false    203            v           1259    16567 	   tur_dsc_i    INDEX     @   CREATE INDEX tur_dsc_i ON public.turmas USING btree (cod_disc);
    DROP INDEX public.tur_dsc_i;
       public            postgres    false    208            y           1259    16568 	   tur_prf_i    INDEX     @   CREATE INDEX tur_prf_i ON public.turmas USING btree (cod_prof);
    DROP INDEX public.tur_prf_i;
       public            postgres    false    208            �           2606    16523    alunos alu_crs_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alu_crs_fk FOREIGN KEY (cod_curso) REFERENCES public.cursos(cod_curso);
 ;   ALTER TABLE ONLY public.alunos DROP CONSTRAINT alu_crs_fk;
       public          postgres    false    2912    202    207            �           2606    16493    cursos crs_prf_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT crs_prf_fk FOREIGN KEY (cod_coord) REFERENCES public.professores(cod_prof);
 ;   ALTER TABLE ONLY public.cursos DROP CONSTRAINT crs_prf_fk;
       public          postgres    false    2918    203    202            �           2606    16513    curriculos cur_crs_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.curriculos
    ADD CONSTRAINT cur_crs_fk FOREIGN KEY (cod_curso) REFERENCES public.cursos(cod_curso);
 ?   ALTER TABLE ONLY public.curriculos DROP CONSTRAINT cur_crs_fk;
       public          postgres    false    202    206    2912            �           2606    16518    curriculos cur_dsc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.curriculos
    ADD CONSTRAINT cur_dsc_fk FOREIGN KEY (cod_disc) REFERENCES public.disciplinas(cod_disc);
 ?   ALTER TABLE ONLY public.curriculos DROP CONSTRAINT cur_dsc_fk;
       public          postgres    false    2922    206    204            �           2606    16417    disciplinas dsc_equiv_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT dsc_equiv_fk FOREIGN KEY (cod_disc) REFERENCES public.disciplinas(cod_disc);
 B   ALTER TABLE ONLY public.disciplinas DROP CONSTRAINT dsc_equiv_fk;
       public          postgres    false    204    2922    204            �           2606    16543    historicos_escolares hst_alu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.historicos_escolares
    ADD CONSTRAINT hst_alu_fk FOREIGN KEY (mat_alu) REFERENCES public.alunos(mat_alu);
 I   ALTER TABLE ONLY public.historicos_escolares DROP CONSTRAINT hst_alu_fk;
       public          postgres    false    2933    207    209            �           2606    16538    historicos_escolares hst_dsc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.historicos_escolares
    ADD CONSTRAINT hst_dsc_fk FOREIGN KEY (cod_disc) REFERENCES public.disciplinas(cod_disc);
 I   ALTER TABLE ONLY public.historicos_escolares DROP CONSTRAINT hst_dsc_fk;
       public          postgres    false    204    209    2922            �           2606    16553    turmas_matriculadas mat_alu_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_matriculadas
    ADD CONSTRAINT mat_alu_fk FOREIGN KEY (mat_alu) REFERENCES public.alunos(mat_alu);
 H   ALTER TABLE ONLY public.turmas_matriculadas DROP CONSTRAINT mat_alu_fk;
       public          postgres    false    210    2933    207            �           2606    16548    turmas_matriculadas mat_tur_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.turmas_matriculadas
    ADD CONSTRAINT mat_tur_fk FOREIGN KEY (ano, semestre, cod_disc, turma) REFERENCES public.turmas(ano, semestre, cod_disc, turma);
 H   ALTER TABLE ONLY public.turmas_matriculadas DROP CONSTRAINT mat_tur_fk;
       public          postgres    false    2936    208    208    208    208    210    210    210    210            �           2606    16503    pre_requisitos pre_dsc_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pre_requisitos
    ADD CONSTRAINT pre_dsc_fk FOREIGN KEY (cod_disc) REFERENCES public.disciplinas(cod_disc);
 C   ALTER TABLE ONLY public.pre_requisitos DROP CONSTRAINT pre_dsc_fk;
       public          postgres    false    204    205    2922            �           2606    16508    pre_requisitos pre_dsc_pre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pre_requisitos
    ADD CONSTRAINT pre_dsc_pre_fk FOREIGN KEY (cod_disc_pre) REFERENCES public.disciplinas(cod_disc);
 G   ALTER TABLE ONLY public.pre_requisitos DROP CONSTRAINT pre_dsc_pre_fk;
       public          postgres    false    2922    204    205            �           2606    16498    professores prf_crs_fk    FK CONSTRAINT        ALTER TABLE ONLY public.professores
    ADD CONSTRAINT prf_crs_fk FOREIGN KEY (cod_curso) REFERENCES public.cursos(cod_curso);
 @   ALTER TABLE ONLY public.professores DROP CONSTRAINT prf_crs_fk;
       public          postgres    false    203    202    2912            �           2606    16528    turmas tur_dsc_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT tur_dsc_fk FOREIGN KEY (cod_disc) REFERENCES public.disciplinas(cod_disc);
 ;   ALTER TABLE ONLY public.turmas DROP CONSTRAINT tur_dsc_fk;
       public          postgres    false    204    2922    208            �           2606    16533    turmas tur_prf_fk    FK CONSTRAINT     }   ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT tur_prf_fk FOREIGN KEY (cod_prof) REFERENCES public.professores(cod_prof);
 ;   ALTER TABLE ONLY public.turmas DROP CONSTRAINT tur_prf_fk;
       public          postgres    false    2918    203    208               �
  x�]Yْ�V}�Rw_��f0�������Ռ��q��>�wUt�鼹���(��f�b��ǃ��i�`�a�iZ���y����(�Kg�;Hyr�������O��8s� �I�sûq;M˥�mϚ�³Zg��岬�c�)kB�)R��K5�c���6��%m6"����y�\K	�W�:�����L�y���=��֑!vx��b�h
_*�x���&���@���u���u��w+��d�I�/�R��e�^ւ�v(�F��nx9~-���E9Č�l�>4�b��l);o|��5F�케�� ���,P���Y	�APm��q=�V3�S
@3i�-��m>����Iދ�.L'[����6OK�Y���r����1���x;��4Wh���G�؎��1���È�&�E��Z+j̤�������e����i�4�������Oa�*����u�Jt�G��\�9�(l\��:�7	9��K����L筊�7�T�2K�s�r�FI��_Em0l*� �4�ƛ�k�և�ڌI�������ѭ0��O�6�L�in8�p�4�s�S�+(��P��c0��T��"���Q�����Z�^x�7��<{�z�� T; ������ߺ2b�� �45�_�['��*�*�����,`��Q0d/�����8-���VL�F�}�O�vnC�z�T�~7'l�]��#W�:��������]���ɳGcP��\5F����nE�������p9_��lV�����j�ڞV�e��1\�[iM�`tכekW�������%v�z��0�ݸ�J���F�2Q�>�s�?��	�ʌ(�u�VX�$��4���r�`L7�$wGE��o@�,Vl��Y��~�V�k��aNOK�
R�˴,�z߅��(���j"<�.4��ǂtMOJ2��Ժ/�`J��� |�n�F�;�@X��d>�H���\����4)c�� ��	~w��GBƆ��FY�)r��kA�R�G�"���0Epd�ZS�m<(�Z9Eըf�侭w�W)�������Z�UR5#,u���H?���SV�lwLD��<����Ɉ����)Ԏ�N���?�r��X�H2\"�Â�u��M�����}5~�j_P�HӀ�:!z���B�!��ҋD$(����eK0g��}�Y�ȋ7�1k欑UM�H��Ź�VTl��T��Dν8?�(�a��h�P��� gT��\��)�C�x�CfXt�e���)Az�|����^�:���3��YN�i+MTEQ�Rq��ɳ��m�2�t��pL��k���Z��!h�B�$9?<���@E�P�LO,��{�^p!t5ʤ0�	�o^��\p�4����U��.�Z	�œ돟E��U�z�����M���L8�o��u�^�D�d��Jg�J�l`"�H9p�7㜃��Y�<�2�K��n=����ϳDQ9��m��8/z���w[��^u��D�KeWӛ@-7$�]R�^�[JkK=���!~v�7"&��fz�Y*;T�9*��ċS	CyKŉ�]��`�ND��A�q��O'!UeƁƁ�b���fF�$���c�fV��'m��E��rRy�ys[*%�ơ��8fM��&�?��2�K�%���7xO(��^e�:�c�$�
 ���θX��gQ4�����8��:� W�@9T��ibyF�4��T���v-�9$�����"BK�����;lVK���69��TW�J���}���~?/?�Rݐ��c�S��PzZ�:�dz�h��6ڡC�<)@CY�]7�u"�Pz������-�A�]WA�'.
��8�־�,��! ����[lw��"����RI���Z�E�`��9-��
��V�%H��4���!`��O+�d��X`����1�<}��a�="]*��u([L5x��#�y���)geR�`ᑦE>q4`7V���Kg�.�s�X*�hA�V�\3��\$c%�K*��41�d�ގ����m_yҧ������7tZh5�=[,vR����B `*yH��{{;լ4tj�*�<�y9V��C�(�;I(��y�R��昑�uuE=7����H':��I�D��X��BWT)�!��-X�Q-���_c�.w06��1�zo5�1�DV}���m�<��jɐ,�%�!��U�Ȝ��RQ�2V�<�)ѕ<�N:�Ms�c��]-WX�OۭD\Ӯ�e#]��{j�~�h�꿷�0��u�ÚF<�[�M�b�喚�^O�6�l%|��(̛� ׳G�ԕy�N�&f�nf�/*m���:o��`����p�Ɏ*��n�1I�؉d�U�Aӭ,^'����0(<x��|�t���ӏ�c��i;�v\32�ƭSV�B�X���<Zg�8�t�&mۯn��Ǵ}�
�w��L�%�ɝ�*b+(G�t�1"��� X�eYq�cЄ��XN���(�`a�����%d`9"6y�i�g�I��4��9 X�*�\m��ݡ�c�2�)���z���s���(��"�\9K�@�8�b����1>�C��8�&��r���<��A1�rzB�L�٥5?o#����}�C(ݝO-�KC8����Ǐ*�^�R;��(�3�3�e}/���g��|��,�v|���߿$��         0   x�s��44�r�4�г�r�4�4�.�&�&@ڕӀ�H��qqq �i_         �  x�E�˭%1D�}��5���?��6`��d��# 0����y�}Tl�>��FWL�`,�� Rط�a4k�pa�ǌȼ(務�U�J��EejU5�����Q|Q��!T�`���}ǑpU�$��ef�Zh:�󨁭�V�!����jU(K��
T�����.����h��a����D���f�w��NԽ\�I�	�;,r:L�iY4�bhΞ��܀�w���n@��������%���{p��B1��g�,z�t��;c{k;W���|l��b�d�\���]o�Ɍz{L^�Ц���:�Գy�Μ\���cO���T;�qy5\zθs���c9��s����NW�Xϟ��������!�c�ع0���|����pc��:�j]����ϐD�-V�(���4�W��̷X����������p�p����C1��|z�ev2�^�a��i|��V�~���oX1�c�ޓ�N=�x��[4�����~��}\�         n   x�5�=�0@��>�O���Ge.��,�cU�H�H{�0�Oo Y��͊v�[��ŴC������F�����
�\�n-ޱ��+=�a޻Vo{Pv�i��8$|]���"D            x��W�r�8=�_�/pq_�	�H����T.��9��o�II�k��������q\ŧ�$�E�nm����Z��V����O����%�㲨 e�(&��-���KȤ��$�5�|���S�f��MF�hS���)��ELlj�g�5S�#I�!]�f�}�]9s|��^U��bqFҤ���E,�h%�Qǣ&�l��'ZY��P�#ʔ.Ο+����u���	���P&���)��@EF>�!19�:�|�l�ӂKi�$G���y�{1�z�p1E�%��ʸ n��DB$t���*4�����]����W��^I�U��<H����F�gag1�����Ӧ�����
�]���Ҝ�k>]�p6Ut�!ayl�C�Ίi1PEDd�*�8�hS���E���C�� �aT����<������jbpp�k�=��u�'%��mX���e��i���"�c�f�,a��0 5?�Wb�ű)S`�Q��E�1K��1��;�x�(�?�PN��v&Ra���)i%�x�&=܌�\���e�:���CYz`�ߧ�L	��ę!gm0V�Gc�Z�q� {[j^M̓s���1]9x���AUvJO��bQD�V\'t+�>m���zdj���Q�9�sl<c�,>-Mb;}�ʴ�?�*���4>���_���:�swn�r���o�\��VՑ���4~��#�|���)��M��!-��jm�߼�(��'��*e���cɲ�t��"2ۯxR-k��K�u�<Z��;p��V!;��!1-�!�q^3X����N�
z���AB���mh�An_�b�5|.�(Z�?��fj��ӊ:pI aM<��e�_�e�$M�%�I�(5=�sGd����C�]��l�ǚ�>z�` ��ӚB	�4ύ�������a!.\�����2nl
aw�f<d�eU��H�c�j����NGZ|��,;�'����ę�ļu`I{TN�v'�����Ii��$zE�W�)dT5F��9E�%(˽���T�A'�<�e�=��7��_L�1�/��yƔj����s�+�G69���'���~��������dёS�&���J¤���Bڜ�A0�A��-6��z<��	���n���Ⱥ�8I�4D?��$6��0Y�k[��grZ�ځg��IŵǕf�KB�ۦ@!8hp=ILMC����a�*9p��J;+V�:��ǲK�:�o�w\?xe����;��bq^Ŧ'5���%'���a���F��1N�=�%���`x���:���_@�����Mb���ؚ�ieZ��:��W�}���w���
��Z7p�M�.e�jF�{�{�j����4��4��䤉���x������4��	�)�H��7a{���)q_�!M?8dE}lvCb�8[���f�,���`�ʑ�]�Fvs���J�:��6���մv�[gl#�w�����24��a��m�i0���1��F��h��{�5�1��y���X���ݯ|;b�gr��A��"S���(�挽�Ã-R�,��|�]�r{>Z�"�#Z���tt����?�=�x�������OJ3            x�}�9�e+�%j�0��rʫ�e����>Ԡ����}hĒ��ߗ~闿��o�����Z����_�����ϖϿ���������i�������b�^��z�7~������p�֭d���~�Z3\O��/�_N������[i��}-�K��O�y�|K�������N�������������SO�Y}=�|�������3��˖��O�k�1/�F���~�h����%�(�ڸ.نۿ%�9/s1�����e�&���<������GV�svEO�]1ZP��c=qZ�^n��8/����������fZ���~��7+�6�Y�?|�cI�����k��G��v݅�����%�����`���ü/�����W~w���{P��n�z�r�׋�Bg� ��o�\����c�6��c�2Hi{,V�K�~�.U��X��p��Yɍ��ރN��5�Jf�zw2%�ﭳ�����Y��7��X�?l��;��/���N�m����U��U�$�VvS^C��ܒp���ǔZ��u�ÿ�{�U�s۲�� ����[���j����o���|�BϽs�W ���U4�[��۫iP^g�P���Z����ׯ�j�o��;��↷�?��N��-�y
���aX�[��b�tU�Ϩo+��J��b��!�`����ƥE���3f���W�WZ>�U��z�:P��?7�_�;o�`���RB�_�.����:��2m4���r]%��]b�{s��KD]~�'6N/M�p}iBj4n*�g��y	���҂4(SZk�L}��G�'PYCDp���`��ݘ�
3�����0�F|P\cn�*k̽�G}J�2�V��ү?y>�)�8?�D�S2�x��n���^F�H����U�.��_Umg؊��� ��n��mJ9��U�7�A���N��V�F�^�[ٙX��j:�\§˧�қX���;��ݸ��}��N'��˟Ea#r��<܈��������l�۲��{��Y�����E����2��{j��U-zɎ���� ��N��M��x�`T؎��8< ���������Ӟ��C�k9;�_V�ေ��÷d�_m�@��j�10�x�� �s�9�I �ڟI	�d}�)p8 �ɟӘ �~�2 �ܑ� �H�ʋI���<?5��2	��tߖI�?�`��`��͂4���>=��|;RN'�#��G. 	��I���^g*��?��E�Az�^�`�\�`��]���PgbKM_��@��E��.		lT�g���ه%���,@Ư���]���H֋��/3 �f��W�]��Ų �omQ�o[
h�:o����LK��}���@�4�N�ԸV��C0.��Bp�;�ӳ�+���V�X8$�'��6q���/0�<񢀽#�|��OGY�E��U )y�O�[Q���'YH`n�PGl� ��;�	��n�����nڷ�ya��g�f:&4�;6��>,�7/O[`�y�+�"?��R�ں���O����C�,@��2&���eL����&Ѐo�40Ƀ�Λ��է{x`��q&�IK�m�O�c~����5��	<G O��V�	@��
�b�\h`:�eY`������(TO�*ͮ�aZ)G���N@!�>40�rg��n~�C �_2kx8 ��:�$'�H�'�� ��ՇS`�e�3ڋ�i)���?�(W�c����a 0�m�_���?�y����#�h2֯�ƴ��q��8�{�+�*~L���umnu���t��8���׆�\�=�����`Za�K�fi;�K��Qg��.��0�����Xq��2����ˏ�w��,���K-���i< ��{x&j�� P>\6�_�l�	����¤;'�9���M��ݞ�:�Z������8&y��j�p6+뼇M���-{��mNS�����ߞ{��́������v��'n�ӹ��T�~�N�d�7�b���#��8���ʼ�c�N��f����P�s���ݵȆ�3��g��ˎEř{���Ξ�Ӎ6�eC�_�[cӭ���,5Ԯ�y���3!���Dlj���lAL�$��ٳ���}�,�Còi�����y?
�Z�W��e���ڮ��
���c���~��W	4��_`VP3<��X�8(�q*�L��A0S�ry�; ��z�L��č�R�a�o��E�Po3�I��v��X��|�+}@��d�U�-��Rm�h�O�$W��`�I���[�T��2��C�-n����:Bh���n���zE����Ja4��u�O@�uK���x�����j�����V�6�����I�m	4��
Հ�|��?��;f�?0�n+�ʟ�7�Xb�>g4Ss���O�Xgo��܊�I���?�8P��څ��aX���]8�_`n`X��:��7g@wܧ�g����s{.uB�_�d� ,'n|Φ�����8��)<yd��4d��j�'��j�ܪ֟Y->���O`�";�+n������_� �2��*���ߤh|���	�^�����<��2I0��/�*Ώ�eС�����]�OnP}�ش���'�$<b��f�ù[=���4��>m��W�O5� �p9�Y��7c�L��j p`�JHWaexL��m�_��ED����/�*�۔"�~B�n�*�n-�-��N��8�A4@�Q;��ܩ�C�gV������
c�Oc//"7�s�k#R�5£�����ͣ�c��8�k�5����AI��ہ����1jgx(�܆�viǃ��]����t�i�6�gB���O������C���H�/6��~�ز�CJ�3��A�4���ݭM>����l��9����Y�-���U�����t�dz�Ϫ�S뀯��m������D���u��f�����q��Hc��Z��m�~F�KI�A��J�,�w���g��[�:ݿ��/IFOC������lP�Htw��~a���v�B�����{�>�9��Y֖܆יҩ��Ե��w�=ui9�^��j����Gk9�ꗺM$9��I&5ܠPȮ�����4^����b����4t׭����E�a�^U��p{��T��	as��Q��i|i+�,BҞ�º��|t�^%�*��&C^�:�� g�L�_b���7=���J�Ut(�1���b�t�]Ńm�w_G�U<v�1���'�Q�Ut�4K�����+60�l���:� ����qi�N�������a6��:Sz�~hv�(�����O�܈4x�#�v�.��P���N@��8�-���j�8�/�iY���e�A� χ��*��L�U?4����.�����rZ�i�M^&[��pJ��N��1K[��*z�R�:���r�w�E���]0)S�^ֺ�~�4�`��3����p��哟��U�R�SsZ�������j�q4�=����R� >��F�.dd�:(xjv���L�̆�tU�0cS]p)m
XJ�·C��l����8K��1���4�}LT��|�JKU:��3�֠��J'%%6RW��^ʴ�?/5�Ja�/W�ӕ�%1Ț�,<0sL�=��I%�V9Z��$�h���6B�Jl�N#+4CȈ6�I_��k{�Kꚿ�o}��g�"G_S���j6��4A`��	�v5�p\7|����;j(��q��A��d�A�}�G��ƼB�>,Z��*�`���;�<,��f(�	u�E��:�4Y�F�F�j~�Qu����J�{���`�i�t֠�8ǣ�x�~����uSh��F�XҒM
���Q��q�˫���9KM�)E������J��&�IU�`��!�?gk��;?��iE	�l#��py!\�Ш�2Y@G��
���
�ō��?��@�t�Y���)��r8_��ڌg�f3�tH����D� l�V��bG
�l���(,��}$�t:���QH$і܏>:t��*}�E{E���X�Ik��ej*d�u ��kFp�ցT�i1�9�ᬄ���x��b�֦ܗFuЈ=���;�d�@��ì���>P)�����T�.��~yu��Yu\ƤT�n+��UM���aa�$0`��Ǻ>\��    /98��G��������Y���$�fA�Y�-�)�Ë c�(8�/�AitH����nM"�X���:�6
�{/Vk{��E����p�t9���,ίƪ��K�f��]�����|��{�B#�_pv���7C�JG��m捻/[����^OV痳��
���jNj��a�~��Hi"NgOvWU��Ʌ�(eC�k�sJ���kfKk�oKOu��4�]�i�a�q�lS���Â?�]��r�M�1V��K�ʕ+IJ5�3UI*�#���r��NU�z����JR��Q��$�NQ�mԛt��ʎx�xQj������
T�2�s��C�zCw.C�A%IbS�P�-�֢���
�3�P��8U�<9���LIV������`��nʹQ�Ј�]�侟ph*_L_l��c=�$�bל��aus�,�Ț,��s-��H�����{%ekW1��>,j+���s��;v1S��D��`T�VG��K���N.2M�44�;M����=Y���m�r4�i�H�JI0ǁ��u(��};�8��un(�ܞ-1n�Q��b6�pe���wT�ξr�J��Z�`s�;ǻBӿ��L�tq�p3m���sS-�7���!����|���K���?�����O{@��gwS��{qG�{q�<���_UY�H�cN����?KV��b��J���\pDk���n�\O0u��j�j�
��@�����Cv!+
��|.�Ӭ>h����|Zr��̰�8bk]��T�ǜqF�[�ig�Q�[�]Vt[�Cj�]wc= k�'�%sdm`�.r�<�X�u+ڬ"@�	�Tݤ��Me��H��O����TB	\�UJMT*�������prN%�W�p>Zo�B�+��v)//��X�pV���Ck���^� �*�����O퐢����
���zS�,T��4����� j,��\ӟƎ���i@��q:_�># sj�W��?�g$�rX}J7tj¦^��e�M��@���3C-�7�n�<�4�`'���;�O���/����!p�~y�Ќ&�9� �Rc�ܧ��.���s�,���"��e�VwP����� 6��U�a��=�5x�K�+�px�%WF�6�
���!��i�'"��o�W����R�c]V��d]<6[�����I��q����?�+��C�P]�AE&���4�{���ȋ�r�'�Uޗ_��k7�����M������<�
����~�s?ʴ܍�I{��.Z�x�|H���cK�����X��S�`��%��ڞt�����B��CQX��O�{Ro�CvW���;�4p�1[���敢�^i��l�4���`4�u��	��s{�m��/�����i-n�/zh^Kw�IN�͛�{�<
���@i�2eV��ܲ�x��Ew�������G�:�Y��̨IiD}��`�JN��A20�K+���|(��\��i�d�8�ӆ�#�꧍���g��..]i��~B|��iX�yX�c�oC���w��e˺��l��B?(��r �CR#��ᑍ�S�ڗ��U�"�ߝ�E�ӈ| ��ƶ����'�Nce?�S�6[0pZƆ��vkY�#C�.h��Ñ@"C S"�E�ttLsQʝ��F2�^O�a���l+J�'G�Y	�l����9���'���h'�H��H��5�Q�/G`�g5�����E�`K��|���^�:�@Ǜr�9M�|�J�	�N��$����N�NMo]�.|�8C*��$�S�[�,4�R�n>�uLn{�uN9�)}�lQ}���~.o���RC����T)"h�!=�k�P�B	w�M���8}a޵�6�;���`Lu���'FV3Ou]9ԭ�ڣ�O�_>ҧilk��>��=�'m��	l+���\J]ȗSw?�����Ktf|���]+@��ö523��[W���ԍ(G(�Ǽ�o�\YG�E׹�t�&��w����:�Bh��3�dT�1=_v�@`Eg?i�/�֡����Q�[>�zw�s��>�f7Lr���w۰>_�\��/i�����I�m2䅜)�|R�cH�Yq�D��}�Kr��_/:�9��~7e��Ӝ1����6;;���KfԠ�:#\ϟ-|1��\��D.)0��d�$2���\8WGz	����F$_���|�C�j6�G�ᩫ�Z�����,Jd�?��d������tAui�/���|��z/��/%�?;ݩA��3�$6zIw��D	���#��Ňӑ�@t<t�FO�gg�+��r�G�D`��õ&��U�&��ƭ���s��8�Ʉ��`��:�@�
��|�������<g' 2!D���{� O��݉�Fd�g�Ǳ�SU��Y��3"��k�Vobw�(L�cr^+��y���s��0��{)DK��|��)�=`Rɞ�����m��B��i�Ȗ7��l�Zތ��;q-~�^sj*(��ጦ���8<���=fb��oHQ-��g���f���s� �>8g*��W
���psW�����:3.�,��j[K4��ϟ&ʅ^�xY p3���Y]/��`N�U��"��O;w��O(���Ȩ�;բM2G���s����Ϸ���#�u��un" �5�p_ޢ�h�J�0]�g�-�÷{��F�y�._*;4�KѲ�jk�#�2�H\5uI��-��5
�J�U*�G��Նv:��{�h��I����`5s�.{�c�+��s3�7����l�O��}�P�ش�!2���J�a��� ����0�Wdw�R������+4ir'�����;�7Sy�n'���+��^��jد���Fg� ߖ�1�-�L�M��i�F���0�_'C�1�R�o�^uJ������׮�}�tׄL�%$AeW����=x?�u8�S��kq��λR)�.��գ��K�2�oO�`�H�m��]a��vi����.%%=����Ҡ��b��/w��h�'���{	v��YG�u��Ǭ1
��$���
vr�1hJ�ʒs
����F� ��\@�P(a��2��~�6�G�E���`�I��~>���-U��W����=���Z�[�4H%x��E�hz�Jnu�3[�� $u��.�65���Ƨ.-���JG! �%���n�H% �Lu����h��N��g{k��Lmu4���i���S��s�´̗�`U�%�ײ��/���i���u�Hׄ&��?�L�� ���
 ![\�E��\��:y���`@|�*t�\�W�ܤ�j5k��5S�:�������,�.���L��|V����WGlȹ�כ�Ev�H���%Wѐ*-Ԁ�|�yx�WJ���h�ƴl�*�F���n&�\Z+O�ĩ����é~++[�۽9��Kp0V�qy>m��ܳ�4]+��7~W0Wk�rc*�zj�P8J��d�n���������t,S�]�W�gfұ~��s��z8١�r*�X[������Z0���j�'#�OM�Bo���%�3�.7���3DO+�*CT��4���Ρc@�?�0�J8��m���Z��+�ô��}F�B�D��'3-|��;�H�ՉB���yw��4����K�KV�3�4�>��z`���O��B��p���S�lcjl_�PD��_BH��J��T�Pڊ*��q;]#Omr#�X|,�����L?8>=�Yj���i{�xH�W?<��M��aO�����E�ڮ~���=<����d7���BQ��b�ŢL��˾5Q����SV�<��#&b܅�f��Ɍ�0��Y/
�0�a�B�	�-�����кŵзD{?	�Rt���8#>ߝ�xaB�	l�p�6��;Xgs/�Fm���a�;�O�}qefd�gG�0��;����u�
��f�x3p>��5<����^���ʰ-R�/�Z�`Ij�R>� �$ä�ΛDѴ^�r�ER^�LV����zC��|��&S	��ӓS3M
�{z%�И��J��č4֬k@q�B��a_&g3��`�p�r"��Ƞ<-�C�/zo+�;�/����CdA��v����o�{Iw���7S{p��9Z���ٞ3��c�����~z��<�:Ej����=c�Pw�t���^R�JU����J�    ��òl-wxX�W�,;c���Y<��K[�@�ñ4����������H߃�����L���-���l9(�G�E�`H��ˇ\������:]N��_�J��w'�xI=
�N��ո�-=�A�|�sܱ��ޭO���]����m��]]���^��8/���D}7�OkxG��̷�B�� �ڎ!r�t�l�=f�YdK=�1��1Ч�����gLQ���%k��l�-�_�
zB1�����lֿ��$�2���A�6,ZT��RL&�M�%^��.X&����;G\�w��cQ+s\�#츣J�M�r~�ݵS��DR��=
M0�.��hy�'�dp�B��$�a�H��;� E��˸˰�(��n�E�R��jF_���[��.p����i!o���b/n>�/�(�.5�.Z�<�I}����Q����C����)
���%k�s@��w�~8}�v���m�\��l\��e�)1�㹗�?7eh�V3F���e2G����S/��Dٖ6^�h��N/��������Z����Oz[�T��	崑� U��&��~v���j+j<�	��:FQ��'����-��7��K;;\��r��-�3���^g����n�mݥ8��U���Y%x��%t���]+�'��'�t��s	HC*�Q��Jc�r�Z�*�����R=S�ƍSiF���@�)��\9�Z&���&�p��L� �k?g1�ڵh��x�=r�S���ӀH�Dר���C�u鲌�Wj(�w��<bĳ%�Fd	q�GbD�W3ĥq�vǈ�Rc�8�T<����n�1)Bc���HqS�ё��<�&#����
�l�Gʄ��E���|ܲ�|�C�?��dB���G�0Sq.V�=v&,"��~�)���G�.�0�O��^�P��>��L:�!�aK8NC^䋜���L�Z��/PU�L�Ȥ�g8�!�k�6ʸ���1��J�ކ������T����h�=8k`Z����)��m���|�I'��Ej �_S�iX���>FxX�okL��фyXmW�۔8�~�p�k>�*�(��ho�ɭ�Io�����6/ř��uq��
�[s.�W�PE�X_������1�O���8=]b���F����(�"�w�L��+��3�G�wb\T�i)�[1�25�t%(��ˬ�k|y�[��-������}[]�Ű*ϴ7���
�J̺$ �-�j_M�|Ҵ���:�C����bס�Y3'4������/`��.��?�?<|
N��Y�Sv��)�����������r'ɧ��(r�Y�7.��4�8�˳���ko����(~�a���ɠ���ŷ���D��.n�K�H��A�	h��E�S�Ψ�k���g������LO�D(xz�=��{��e:�Ȇ_&J�s�*dޟ��L��s�
���9c��\pǇsס���1)�逜ww�`y&Z��fÙuk��j�R���.�j��l�����
�^%N�cP��qD��L�}8iB���=�ө)�t�?̽�A�׫�k�[��Z��^����:P{@���%]���M'�Fx`킋1���2�&�t���R�ř���~�$���ߑ�Md�"L��|?��߂ ���8�R���&2"�S�Yl���pV�!�ę�i��xzuOԢ5\�ل�Ɲ�;�x�&����M$]3��+8a�օ��\{��Oǲ
fWD�����'Z�it	§Q�ʛ���y�YS�d���P�C���hh�珴_���Pā����Á"-�F��ǯn<Y��R���E�Y��,,X���,JR�+��O{��<X�a>xp[��A��(��H���պ��u��p��`����Fm��E��*t#~5�����.4Ya����w��������̆���|���mV�N-�]ay�p\Y�,�<����5����}e���qȽo2Dzm�������g%A)8{5<e_L�>��/<v��ڑ�k�?��Z�����X�_s��S�Σ�%ܾi��kcU�#����/˃�&�������B	���U�ȓ��{6�{�c�����D1�w����s<�HEq����/�z��/&ܪ��"��qT�Y���>�᫯�¥x#�REw�b¥�S���P]�MC�c����naBN(�!���~�{�5U��_ݴn�������GUhc�̘B!�\���'�܇�I����J��b�|�
�B���/�`U�%��P�W�݇��K�ˬd5_��N���~5L{*?�R�u�bE@�ۮ�Գ�+7��t�W��U	�t�_�ʉ���a�7��L�K��Eg`/�Z�B.��VjnS�5���a^W�Ɵ�ބ�׸�����-�{�>�@8��k��drZ�C�g�6�����D�ү��z�/���	��z�b\�^�$6����j�REߤѧG82*����!�"e��M����y��d���C8hvBmQ7b�1��p�"�4L����9K��|���z��N��AH�Z�jHaBB��gO��r�ئ��F����T���i�O�s
�����#�|Z���G�T�1�kb�4�%�6�	�B�Y�*~�Fu.�f��FTDSpLߝg
%��n")�g��5~@��K�TTB�M.:LR�����j����"ݾ�lАr8��uF�/T��4&��B�W�\������S۽��A��/8*�O3v�U�����h�з�7,�tKc���-�{�P��2�S��i�Y�+��M	X�d�)6�ʱL��Y��}d�G�a1x�nu%%�Eh-݄bMhj�=�	ѱ%�ʻ�Z��g��}��ɷ��̊�x��a+<%�
���t�����I�rh�ZƱ�I
3�mǄ���F� ��� ���I-�9�/��b,Uk�3�cǇa0Gav���(��xq��T����|:�>�-�{J��pd�s� M����P���^E�2/�Z`�� ��e>���)ʧЗ��/a-?-y��O��W<?q�Eq:��];��>�Z2�W�����R�n*cʖ�~Z�,�k��Z�7?!GXKE��G���=nyvR�X���0O�;v���L�;�!���}ꐊt�}����S�&��cG��O;�7�q5��� �^��*�|^S V�8:���p籺���c�E(/�*V4r��O$�S����RS� f_�]��{L\_A:�T��Z凌��.�߈0s�d�W%Y1�Wd��\.�=��{���*��~�KL���BK��ꈩ(
��7�t�#��sӑ-1�tD'SWB�u-"EKu������� R�Ŀ��y	�W��>c�xR(k����cvV|;۸�&�����G/�'Əw�Z�g}��%<KX����L1��Н.�%;^$|�ܓ���-S�F�?ܛ7��	+����ե��ҩ��?�Dmsf��}�)o�����_(��U�&F��'�5z�����tI�j�6��z��Ȓ���ˈ�5R��%�ԇ	��U�v��i�H��NO�.���+.z�x� z��?����������H��ј,[5
B�oph/��e���؁��
	G�Pd5����5��H��*\�Њ�%:��������W�ݪ�l$`�|g���P#S����'[�O�K�9�W�.R�n7�4]��n����;����l�u��.痍6�\'F��>C���.�.٠Ը��H�~፞�f9�n��^���\��s�!�я�����@xF����&��d�\LA�~�]$��E�ZLx4�NK��/c��步�s�lU����'�rk�y��	����J��u�#�d�*ʖZ��b�&E1�r�\�)�h�QbE�RoBS�y�����.ܸqHe���rԲ�
4�ж ׻����������g��\L�h�ö�E�|�W,�Z̔�K"|t����X?h�C��|d��Q�ks�0��i�㩊yY��1a^FU���p�Y���^�.�4hS��,�Ioh�uA�D�*j�~W�7��	��߅��ƙ��.ǖW�/&��$(�Y�V�\�!����\,=*x+��6����mgA'~��Y�߭-�c7��.b�\X
�9]ş���U��h��JWp���.����    �������c9D��&y�֔�d�����+]Eˌ*x�����c��嬇h�س��x5�!�&T�U�y���1�����,�l��p*�5�FH|�j6�U�X��(18�LG%Mp�i�M9?7��y�ҹ�i��+�ۨ��
5}Z<U��b��Tm�>ݴe �	/��2 X����/7�/2z+�h|�Q��u�\��}��0R|dz�,x�9\�����>�Ǵ�GqJ�#�S��oZq�y�ZoR�Ey�H�S��/C�+Q����`���p-�Y�G}K]^f'X����iH��K7m|��3D�_F��2	�їT�d�xۥp<�̛����M�x���6�{��|��AsJye��G�T����(�z�n�,�Nָȵ�}� �n���z�s�T��#�W睮u�|;�T#�{��Ե�#�W��C뾳o�- u��2e��Q5v���)η]�[W�Eԩ	xi7�R�T.]�S�+�-��6�@ß~bηU%a��|4��+	�|2�p)��~"�vw�C�n�)8�6�ÏN�z[��^�6�!e��F5�m��F���4�u�p:u�8ˡ��`eȘ$9��i�a-mʩF����i���?Ӫ�Ռu���e���e�X�z8����zJ2j�QMؘ��e>XR�ź�}k��t���v�Sb��>��H:\ Vq��|b��db{,E5�H��Q�{Zi�PYY�/jg_P��ǖ�r�9[�$�T�e.�����(�=�1���E���5���1��"�]ߨ�~<7�AطS�[uD$��3'l����5��s�i���p��6`>�5�t���FkG)�*�>pZ���Vk"�����M*�5Hk���TZQ�d��ac5�pׁ�:5��o�A�}B�v�)�?��%�	VWD�a���:~�ŗM��y�Bă��vR`Bj��躭��G�B]��)��՘@�P�M��R:����C�ß�]�����́�`ڈ��� �hg��b�_׮���O�AN�w���V�fڦ4��l��������6^��r":��r�,��C[���w����\����lv�-h�H�"$��n�#��!�b ��p��
����'p��Z4��mI򃺀z�~��K�@m9��x��,��W���p��,�Z�#��/�s.����8Y���}'�٨|z�.T�J�QST��QBt���6q�$�\JqkU�p}h��pn��i�9�t�����|�GMSU�k),���G�lӽ;wԁzA�B�����cFSk��^gz���ƙe���l��V24��1�A�S��pT=�Ay�rS}n&����qw���PP����P-�y{+$�S�(�*+�V������u��ك�6�|)���`t=Q�l��9���w�辐����͍o�c���塘X}����T��ٿ��T���ЯZY���ޑ��(���M�f�ݲ?����۰L����C�^b~^P_�6~FԾ(($��&�D�[�]�g�c����Bz�E7z��\(:&F�2^��x���(�4=�e��H�kK�@�wф��c����c���)WS��
L�uzu��ö%�w�ǹ����?B�(]Eɴ�i�]u=���<�����.�����0�u5�q�\��>�j&�����]��v�ͦ��\��<98_�tSv�֗ٺ��`S�Z���f�܄y�ۧ8��f�ሮ=�$N���Ψ�"c�'d��W��U,����7E��o�N���:	 ��2n��xs�.�tG	���U�i�EsG���
1�9���,����2b4ƤBp'�=8Ƨ����4�������6�b�'�u�@�����F�ӯ��~ ~��ם����`1�3�d�����,�%
�N�{v��e����������Η�L��ϒ+K�6�m�ـ	2G^]x�tƩ���Y�����i�=�I�Z#�o\�' T���4E�$ZӆG�xP�q[j�"B���i�VSK�1:��KǬG�:�ؐ�@7׋::2��>�q�����cq�Cco�5L��:K.9��>.��e�e�?��qH�;�����C/�s���t�܊�|� Y���m���bj�����kq��틌��W��Y��˃�&7����! +����S�D��#�&��@���#'rc:���Z�kܸ̇V�&v�f�Kӄ��_x ?^�v���}�M 襮��TE��=��X��J>41E�zhb^�9ӄ.��|�Eu;6f����o2�.�(�yd��<QP�r{�D1��c^�^���$1��H�$�އs���ȩ�{���v�߳���\��_n?w�{h��6��K�,�Y�^>$1]�x��_,��]�}Cep�u��w5�y�bI�);f�gb���ƙ�ׇʎ���y+�'f�4e&����p�%@Ŕ���d���(̵�z��V:�-A	�M�>�FNK�jG�q���8<��KY����lZ�3����(3[�]�l�e��[���	Y�a������*"-M7��q)���a���\�dR��=�*Zj	]��?�8;��r�fLKn�� ڞg'�
�YZ�L4\`���a�`��Ażp8,2����tzFf����hو8�OO�O|Ӯ�j�WQ�e�� jcZ�������QP�̙\1���J��e?�2�h�)R!ؾthc`���,̼?�݋�7Ƨ�m[T���$J<RǠ�i"��1�M�EO�T��d�_qu�qn���t�2�Sy�*���b2���V��Ʌ�$5�
�ab�?���k'��,wvPš=<��������5�j�_F�hj�E��6$F��^�fX9�<8nP�[Uv^�W%���[4�.�׫	^�f�� �%���I�wRx��6hR��6Ȕ /?��Ӥ�upE�q�O__�N��0��1�����d�_r�����'xdbc�a��'�[9�x��ڟ�.���N�X*ϥKf�e��j����^K�Z��z��u�SmI%Ù���MV�{�����q\B	������������/B�1�����3�+eo��l�W��d��G#B�2��s-iK_����4	X3��X�x�S���r��@v��HrNH/Ȗd5#TU��B!rڃ���KM �-8�^>4e۞���=|=�6�=����]y�?	v�B�OrX����џl�`L���>��K5��L�@��g����],�[P��+9px�:Ϲq Q��/T{�����Sӷ����P�f.���؇KjKCu9P�!D�Ug#)��G�D6�x�yx�(7�SR9��+�p(���9b�P���
����j��(Ar<h�4թL��mcv�
M�G2�!,�ߖa���yq(�P�Dsd��Vk��6�@X��i��ą�Z(a�٪��w;�i���f�'�A�a,�É�W2���O_0E���K���Ǯ����fRǼM���b5)��<�U���&G��A����s��b�ZEO��!��mo����?�b�4�s1{P8��԰��g�o��L�M���Υ")�R�@�i�~�ڟZ�K)�ҍx�A5��<���q�M_~ye:r�|pA�g��ـ�'t4�� �އ�B��2�
��o_����'a�_t�2[�{PO]�ٻ�ͧw	�3_��������t�-y�AWI�6P��6�*-�Bx��S:P~�?�>��|}������xyEHFr~��h��oc����ng��s�C�����f�G�|IK��eM�$�xB�l���7�Ф���q�3�����:6<%섀d�~r����� /��@Wе|,�+�$1���9�&֓ɮ^��Ƀ�d��9}�d���g�q��g����C;�.t2n�e�N0`�	���N��T�ڧ�%5_%�E�(1�g����Z��<�9#g�S.:9JؙW�4��I�ݧC9$G��9R��B8��Z�Uu6��j�Ȕ��$s�O�����L�&^rm��#�w�k����L�&���B�V��M�S��	�V���8�,=�qK�b�Nx�xm�^��8���-H��^�ޘ΍�s��<�M5�?�*�o���Ă�#.d���4�^�Ŵ2�ݒ��y5���2I��Ӄ���1P�    �q�)�Ov�
���B*\���X��fy���Ĳ����0Ҽ�͏��=���
��V�ȉ��c��(G����S�Ĝ�:�6��S�T{l$�����7�к������B�8i�{)z��zN�+1!�e>MR������[�����qS��g8Z'"���ѫfs�E��E�T
�y|�p)�S޶I��EdJ�%nhh+��X� Ȑ��B�R9��T���!���u�><�aq�������Y�?��tJ�Q2tG�{6���r��&8K�HgԺ[�z�~���'����c����2G����� $,��0.$,�=ө{/��k�k�s'����j�T\�$� !�I6�T��J���B�(�LkrR��t6������_C}�
�}w�e��>��IQ��=���o�B�n#J��*�`�O|LG��N��y^��*��,�����.�L�Q����,�tT10�AG�bY<����_�2UJ�s� �#���L�Ͼ���~����	Uu\V]j�1��O2���J���3�Y�;�l3�A�N7�f����(���b����D���fEM��f��1M��.p�qU��Y�qU��_�j�l�� *���BsS��WI`��/������5X��cc;��q�֦z�8���jU	��۴�a�sQ�G�LWn�hM�J�H�V4հ��6]�
Q�t==Ĥ�N᪆iZ�iLLԪ�!#�j�ƌ��~��&2it���.=#�<!�	N�1�����W����OMh��L�AO���lK�9�I���b]��Hz��6�$�	g�hx��_n,�ȁO��g�u;hZvI��|����̖`P�3��5�̾�s�uò����u�u���P۶QM:�P�G����m5����jO�O���1����蟤[��?��6|:�����D����/L�3t�k�!�aė,@�4���y���d�m(�;EN`L�����*h�Uȡ���ͪ��+�v6VGG��133E���n`� X�?�e���t�3��v��K��Hv|!�����k�p���n�#����'����Y��2O���fp6G�0�k�u���
%{b�����BRsM���8���ʺ�7u2��vR6|���&M^$�Z<w%x�������#�>��pWZx'��銼>1�P&/@c��|:y���W�6�#�E�h[�s��?p��1�d�!_s@O�\^+PZrL�D��"��Њ1�d1��N�Ѧ~�PP��)���d��C�Xk�}u�t}�K8c�$~jڥc0%|��zo���3��u�k�����S*���L�^�r�IW��DR(�����Y�~�zmO�noK	Zg�H8wd��`F���e2ڍ]I��D���~XQ���a��(Sj��J`�2L��L�$�[��S�yO��ӜO�$>|qGhR9�Y��ѭ[��W陧��׻����5���r�$�#��鿁6j��o��D�1��O�A1Q���P����d�R���?���QΥ�e�Η����T>����W��!gs���������I}]GA��b����v�f�8���2�����!��G���`a���O��k�M�Qj|�h`Ҳ��7g���	��0�8��W�	���)VTF�����o�vT.&��D$jur*�VJS1���vS�e��3B� v5��.|d�u��|!�"G�7��y~���H��0�qF��s�& @��'���4]	+b���!%|���Hh��U)Z*|���&���VȠ^��!�:�����X(S&�Vs6��"�Kc1%W� ������#��z�Z�]
�����uۤc�5Y���1ybiLGdj�Z�2{��F������Wތ6+�*���Հ��g����>�q�u��>�t�f�E#%�W���r~����sq�ց�����N�ڹ�OWw��?�V�a��֣?���&����G�@_�'U�Qzu�����=ܚ'3d1�{��"�"uz������}�u��VaN�ނ��.���~���Ǳ�Pyw?W�8�׈m@�#{�]�6_õϤ� �s��o�w�w��������Vgf\�H��2�k���ڏs���f>��DӅf���k���6�~|�+/l}�Kt�`mwt+�X��C6��C5M��ɭ4�J�O�0��|�i?��#TB�f�Y`�!�C6]��[��(w=lӜ��\��p��)�+`�$sS�u�:�4M]�]�FM��I�)d�GTfۅE��o��p)�]¡R{�D��"G�
N�S���+�C>�n\�Hg�JSm����P3&�� �͇�dv�j�N{�P�xQ�ISW��W�<s5{!�%@�Qi�j���yO�{8�����?q��]�T�a��~<S��0!�:�h��Pc"�ݟZ|^��#���_�sB�T���v�Mc�:�<$' �w��l䨧b��Nj�	�|Fu({S1��t��/2c�ePX���1�K�C�X�a�S5��;�T����!"��JdX��
#�p��z����W�R&�v�밙�Wָ�K�ܜ�㥁�̧���좍�^i.�o9�oS���|�lX�ŝW���b`{P�E���_58��j�N�&�>�΄�rqǍB�y�Qe4��c�J8�e��*�Bd�S�~�-�3X��G����K������4���&.����)�7mH��϶�י�
���Bir��w?�8��C�2���,]6�Wd&��^-X�6��F�+�r�1,Z�j`>}���[���Y���M��O��4x< n�
L����jܡ&mP��4QvH�Ja4�� _�i
UE�K|`�ZEQoޞ����n\�|'���u|(L:S�OR�b�dgڇ͟Â�j�t��XS�o�=�~6�A�g#�RS��%N%Wd�K�+��ghH����������q��l٨=�|ZL�ؾ~���6�9w�`�ۦ����M�����YR��rl_�K	%�W�x��ө~	Y�mF1e������]�~׷R�'�:-fw�_�a��L�)
�<��9��X�t��w ��~�M�+���Եp8�.[�⻌IY�_oc����<���*<L]>��}@X�����x��lP���)X%_��<����uޏ��!x)�L������\ *�&w^λb��ם�MN�TU�\���/W%�����y3� �v9�����-�9�f��<��N�hv���7�=6�nƳ�ü���Q�s�Ū��f�9��Pq�w��iav{\1L˿��z�9K���!��
�q��Pnџ�ϑ��!��������4�CkF6�w[�);�^0�W	�Z��]z��e��?n�Mu2I���^�L�ſw.�8�y�b��W�Y�[��=~ߞT����hs�O�ۚPcxĳ+m�A������&��u.��я�K��}2�R3�5�mK%��}�J�z�F,{/S��R� �mi��c1W{~ػTR����Y�p�"A���;�Jp����j��G�������<�����\��Y��a�/��|g����r[�T�~��C%�]�뚻sd��
qӒ�! �G����8���O������b3���*_��3�<�d���4��_%�������?
�3��N�Ӕ�5Yg�����h� ��tHtv���a��=~�%p
�s��ZF'As�<����4�̺��j��a~�-�JM�P�b�*��r��bU�3_����t��(� �/oZ(�8!�L��B@5?�Ү4w��#� 6%`��d��)��!��8�3��j�'V�%p�G��/�9�oXp|�	c��lSjյ�`v���C��:C�_�ݔ�r��Aje��W�h�7:T�qV��|:8n�t���\ �ѷ�K�":����f��e��0��r�3���x��鎆�H�G4\E��"<Bl2��g�B'��Eb<��P <ԕ�h:bMR<\dws���V82�d��o�V�׵~��ɚ��p3�B���ӎ;%��N�iď~ڝ�����y�@j��G�y	ć"H�Z����	KX�)p�EILzU&�9���RW@)ؔ�W2H��Qg���O{Ź�6�41eǀm
^|��S�z
A,$i��tA\�'��ųiIC<ܻ��eJ%�}��5O�     g�ԏT� fH��v<�a�<t/G���Zi���Eo�эbI��P��o:40���g��L!3�$Wr�P��	(���P��t'B��OԆa:���`� ����5�6������M]����֫��p||ѩc����/w��5f8�#.�iD��٩��ǜ×�g~���L	�ou'{�闯�?OW���Q��+�]�cW2n�͹q�̫��}�ڭ�J&׭�J�'>�"/�Ġ[�?�ս7k�00�������+��e�� ��"/���՘����2�dD����ŸT������� ���H��QI���?�Z�N(aW�����e80���h[
���V���hQ��|��P� �qS�"#�����G���={�����.3H��*��7�Ϩu��2.�B�A)�:"��'腰qWA�풚5<b��$��$�2�K/%M�*��3�	,jfn���3v-�y1�o>ב�2�?v,�>�W�Z��WѰg�^Ə�֙_΃�'��2���Y}�V`�t�Im�cOҘ�#�fS~�FNI�%z	W�}߲4'�A\dB}�!^��}�jy���H����G��u�΀͓T���v�N�;)
��R~NT�./`8Z2�)i�,gŀ��_?� v#.16}�2��?�ŋ�m�]�����䍆K-Z፵��|��U7:��Ћ?�#�d��&2��bAˀ�m��F(8��CΞ�'p��}��J�m��z2�As�u\ص�:.*q5� ��򣽊��s��G^j0��q�Wzw���8���S~w����ԟ�O)����j6��$jy��iq��Fũ����к�n�
���/�38pm=�Fu�9*:�;�v�7�<���'^���Mk�Qx=�f]Q����
㗣-�a�=�V�	Q�$�q�c���e��}&cȏ��q)��<uv��·,\i���o�z�	�>Zi@�Nk�w�/�p��蔧+!R�?/:�L<k�qI�nZ�h�|o"0�}�!F8�r�f����R�"@�>39�/{}��BE����_�x��ZDu^�Ne�U��Wn�t��7t��<�	�����V��g���gH�p(����oӋ�w�#ދ��n�v�hW0�,O���Ȍ��5)4�����=���DP��߯�ڧ���$�->�CL�96�zh&8D���W��nNB?�btV�e���I�C�8��T�2@�_��΂�{�~Gf�ˡ��Y���8�����τ]�;��n��|]u{hlrd����Jn��}(п�Wr���EX�w�Μ^Il������}؛����+�e�7�t`�'MEpZA�9�õ�� p^.�6�~�-g1�J	� ����]�?�|�i��LѮ�K[����2s����\޲�n��z!HPB����	r�o�y��F�e�ү{�-m9spa�"&L$�Wr\��Ň�*���'�'&@�ӽp��2����c�7<���,5vm��#Ե��<���;v�*&�.�a����0��4�4�V�� 7;��#h�qJ�7h��z��1.�HP��e�<-�'xe��(�3j��_��xȐ�57��1nsʠ�Y�on�'�|�����<]�.�Rfk��e�0Y���3�k�G+������|!�c�颶���x%w�m���3V(>ܫ�x���ݧ�p�m�OZA�$�%i���1��&������=x&�|w�a��0΄[_ܘ�c�jVn:kŪC��o��Z���˺��<�*��c�"��F�ú͜�Z��g�)����[�X�Ki�3C�d0���ZCM����,v2��ö�q}?U<�Q���IjG��Q��Q�ۯM؊��7��
j��&���}��(L�E\�8G���VB��.h�J���<�g�g���n߫�lt�J���?=����d8jʎ�f4��OTh�ɚ����xh�B��hK����>��s�ZT�����F�t3&R��j@Y
��D_[a�x�l�`�x>�m��XXY
��3]�_��la�d:�*���������t&(�E��Ռɣ��l��4�<;������SsU���s�R�pEt�`$����F��_���'I��tW����z�}��k�
�v�����3f�פ����)�Yq�Xvʊ)��g�`X��k�zY~�
��"_�Z0�Τa��פ���'�Q�k��O��x���{�Y3���Y�O�
IF�_&#�/���K���2x��i�[؏���#���2Z�0�W4�x�V�zL��Cϔ[e����X�����U����ָ��]3_o��c_N���6�����-��6]����|��踞2�G�u�r��>�����1�m�U���2�Ԥ�rM@x�>E�j�gZP�
XJ�V́�7V����j��{UA�	u����+�K�
O�DrHƕ/�,)�����0�ˮ�������ZXC�?޲C1��T"7���*�=�<+��^�"�s�2 ���|�+�[K�����좥�ƑQ�x����@�]<�g|.%�c���������V"�H8.��'���J0�gr�~p�T�h�yט �lg��O�	^��;��X�q��|�4��=�iq�Zi���#ϣn��q{����߯���i_4���������{,7�:o5�jc�S����t`�Ҹ\Q]ܔ<�n�?���P�B?��{����%���ܓ��=��;���!�)�;.�BD�P�&gܑ���}�)яg�����s�T��&���u��_?%<'W��ñ� ���r..�f<��e��\�僻$�)5�ӋF0,��O�tYe�lO	0]��kx�դ�m$#l��,F�C��i#LZ_�V�A����x�V��\�!5�g?�o��+=��Q��B$�.x����^vf�J9]O�
!ĉ;����<���nU�����8 x~.�C�vj���dj\�)8��Ef���G4pj�|v���}V/�B�SX4��8����r�0OL���ɞ�����n�����@v�3a�WTWq��u(#�F4�\\��Jɨ+�:J�6l��m�6�tb��چ�x]�=p�D����]�ұj��~U�������Ȩ�����X�@wk؄@߯�x��~8��G�l�ׯZ~M'����s0�W�\ZR�*���ާ��>��h[i���=�p���~����Q��¹���O���6|�8=���h�c�����\6L��(u��۽��%���G�Rx/K���|�c�6`��^h�)��T%K��l���¾c�ף��ݪ�K6�׾~�r������u��nR�C���W��q>��"���z�~ʓҺzg-�����\�z��n�x�'�?[G��j�NƧW�f_�x�}�E���,���Π�T�=���}����!����b8"X�Cr���c�֣W��W�Dw���}���؍����w;��b��n˵g+�|�{�V&��޷�o�ʸkh5�
�5�(t��C7�reL�S�p����}nǺ�?LT��ֆuM~ۯ��K��؆�a��Q����X����]�7�.yX�g���=�'�u5��ˡ^���c1e�t��O={�ض]�-~���A�W�G����QS�t�+G�s�P�^1�{��u�]����=�{�Qޖ�Ä�H�Ե�ի�M]��5Zط'��6��}�I��)�:��:}�b��:R�/$��uPB�b�Q�6��ץk��a]��� ��Bn����\��Q����N�ܱ����e�2��?��af,�4�=�,c']��t-c�XɈz��(����w� |�T	�7D�c9����>��G�pYz�AT�_�nC[�B]������ ��,���T�����_�+��W�#8�gC� ����O��L�؟�kNCK�����9S�6�#׍p~\I�v�	��r׭�(J���Fc_�u����� ����W�(*�+ꕉ�`l{B�O���=��	k�������g�/�/~8ca��Ln���»���˅��a��m�����ln��2���7�������ݫ� xާ�����}���L�{*��*wmG�$�p���kb���\�A�o�z=h   �Px�5:��oǎ������_�l�e��4��YuW�u�p�'	���wA��7W>E�p�(�+��6w�
�"���o�u�Zi����E.i�dx��o�|��	���F`�筣T	��
9��� t�I��WL��>��ρ�V��>�ǫΰ:Ha[���D
Z��+8鴕1���/�� b��E������W� ���G&4�+���0�Н[o� ��}ZH ��*>�0z�#�!\��,�`q�\��')�"��9m�7<Aq�R�	�� ����PW��l����c�Rۥ�d�!:t4��lnܚ�e��I��y0�?i�+ʧ��_�a*d����T��'MW�%d5r��\�@�T8�z5�SJ�y~��~~�IS�e�u!eG�-�ȭ�������P{T��Z�ƛ������oX��	�t
�?B*�4-�SO�(��K�A,�L�{{
��
�!��&�{^�M+�T��Uo����T[����<�eR�	�9iY��uh��ލ(�[�/�c�{�UMM��aAC��W��ΗW�7zG�勡2�|:��aqgZ-�P�m�Z�$�^�pn������4��<��|%��q���P[�����l�fC���jϻ>����뾷��S��l�����j��|��,Su�q6V���cc"��]�p۪5OfW�f�ݦj͔�Ζ�������~%���P�B������|5y�/5i3�d��Dx�}Ǡ�w3��Q�;P��@jcx��!(�EL��y��-O��>_� ��C�k��~��D�jv��!����MJ���L��S/�i��S�D΢j!�<9�Kp��q��X�L��4�a���z��D��s�����Y�\�[�_�E�|�$�M>�;���	}�L�����:<^"c	��!��񭁐+J�ީh�����R�	a��{����[=ğ;�m��o��c��;���;]zkJfS�E:Z�����C�Ń�aXo��'�l�eցŌ~^F�5�0��$��:H|r�ʌ�M3C�cu0�<��nӑ�f�ٜ̌�y3Ze��g��g&�����-��l���aW*����<j�˫�j�@ߺ�^�8x���=g��-?����'s"����t{�wf�hn� |1��'p�FVtT��;�z�Whf3��<<���W�"�".g�����5����BS+�yѨ<:�|�d(��᥵ �`�б'D���6�U�l��v[k\���u�g�pN����is;k������z�dcnx�'��Τ	�F��I��ԣ�zk�͗NCX_v۝�]���
�M'T鍉�?������P�1�=����ٴ��ָg��;;��4�ヤ���}�N�Ò�����mY�-�;�nhw�7��h�\�^.���0K�.��R,��E�s�%^�݋���k\$�����W8����U��ȦL[=�K���0\y�����O�M-ڥ�O_2�ðf����s�cm�`-�����Kɥ<��J���6,�����4�DE��MW��~/�%Q*��h�����[j�&-����yWԲ�+m�X8�4�K.�9����h�^b�_Qp� ��Ә��]�}���w*�w�����Q�ݑ�ՠ��hwd�W�?Nk�	�m�e��|�;=�Tx)IL2����}�(f��8�x-=놲2M�Q�y[�Bd$���B!�K��%����O���8@b���{	��/��Q�6�ՓiV����Ӕٜ��4jV�p��)Y{?j���lAk� �Φ�+4E����<��ɴgl�^�W�d�C�(FU�) �p�9["������hs%%��x7��n[�b��u>;����L_w����P}V5b�)�Ļ8Y��өų�w>~Jh{�S��I`�,���/�����w清�9}l�tH!m��D�~�DW���
���M�]l싱� ����=����7��?QF� ���a��Q�����:#b�;�Z���'��0�L-~�S�_�w���������s�\���0���=Hz�s�/��ݮ�p��Ң��΄�>d�.�@3�BO�#�rzY�t#�����l
��%WK���8�' ��gW <.�"�j�o�q$<G"J7w��� ����5^�sP4�x��#�4�\�i��oě�7�W	���1B`e���~=�qd�}(Y_2�����B������~���-'h���l�
��+�֕�di����Y��8�D�şu�>BKhx#e�i-x%�ԯ�pJ���_��e���-�
�LHW�Fv.m�끺5�K���#�f3�a� ^�hW~C~:Jޒu�����gl�.7~	_�	���o�	���s���EV7��}A����=$p��\�$��xh��"���~�zEp���eG}9�ˤ������v:W��YK"�zտ�%'��dI�}�`��O�!!��N'�a�K�r[Ҟ<I
�S��J�+W�Idp�G����U	\x���@|<�XB�j��R��S1�2���O�#�X鍁;n8bzJ��Y���[S/~�Ai+}�P��J�·��V���_�^�^���r����Ɂ���D	N����Ŋ���|�z�Ԡ��H�CI6L�-3�r~�GSJ�{K�x��A��S��K$�^����M=ʬ1W����n�+g�]Սf�l]�����ic*Ӯ���O��<�D��<b�UN��ƕ/h���_OH�LH�7�@��� ��R�օf��ł��8g�4!Q��ҕ����t,&xk��Q�����?��� ٰ�m         J  x�m�K�!D�z�	@T������ݲ�����$�U%D[W�5w�f��JC�@n��)���/�U���s���G�+sk�Rȹj^J�h(*I�^i�����r�L�PN�����\��	�L0a���~�O"���16hS[�r�W˒Jf�OT2h���(4"�����h)�J;#g� �C�z(��GK�G�⫲���;ɥe���3Q�۾
�w."TF�9�6�����N_�͢��l�y�J2���A��{���e�V+���I�L���<��׳������KWE���3>My����=e���l��~����{�WQ�         �  x�mS�r�0<3_�/H��y�f�����V�2�9��okK�Tfk�j7��4�����] ڪ�pi�Ju��V�QC����N�6#��#�ʇ�?�n�^�1��c.�f)x#t^�A�)n��k��"���@3Z`Lhr^k��6�"��7C�[�}9�a����������E��\�`��<����X�F���y�'�V��g�eq�,<�p�}1&kR��u�����3���fjx"%�����T���4����W��H>H5�l�"�+9���b�:4�+%�H��/���_��.���xqJ����ŀ���š/�.|^��l�6K(QQ�㵺}I�PX�ɕ���D�˶��m��_���M�Sd!L%��?�JH���{"ʗ�J���s�iwr2��d)x�i!�;�d�?��ӹ�r�'��Gp��g�����0�5R,Ӝ<�(�-9J�>_/��_b�׀         @  x�e�Kn�1���a*Əe"���9:��_�4�� &#�Ř��wH1��/^�J��1�@�����#|���!��w!��+L��)�Y�!)j�c3P��r�<��ZLc$��FNi�ʷ�����w��XjC�x&e��h�<د�$��`����WR�����4��M�&b�b���LF�r2!]q$�`6�`�����c������}1k]��Ĕ 
cЃ�+�ͪ6�,�������c;���t�*�7S�G>Iʝ�Vv���`��S)� �W���.��|(�]:�77r��ÃY7��P�>wң�̞���P�݈kj\��r\
�Zql*�Q�58{#z��φh<�QM+C:-S�Q�2R:�qj{K�U+���Ǫ	��t8���qas�\���l��[��l�c�_TyK���r��g���K�u"��_�����mT�	�����^��:3rz�uj?���2n�{�-4�)1�|���4O�⸵������R�[g�}�쀩C=a��~E�|�9M�S-��(�7�~�����%\;�r^S�����B�TV^*�gl��fg ��u��:���z���G          g	  x���Ir�6��t�������9������3Z�^|�`a���uY֏�o)�y~��Ϗ��~~��׿�>���m_��>��>��m_?�����5�ϖҮLf�~�Q���Xo����zo�+���Zv��W���ŕ��k1��-{i��Z����q�[�����}=�_�c{�7mڷ��ZM�Q��e+?�cYJY>�Wy�G۸>��s�R�[줏c��_~׉7i��b���x�޻qB��7�5��{���_����-vҽѯ|��r�����V���v��._����>W�+�>P�ytMiw�?���Seb��o����nk�MZ[x���2Q���%�5O�zm�L�R��qg�=��%�o��'���w�������e�0e�ݟ��/��������ӆޗ�n{�e���Qp����ÖI��>���׳�Li�6�S}�'���&�x�;ۺT��ꋗ	}Tל��J^;�浃r���yv�I�ɖ)o0~O�N�ID�'O$I�7�;�ϝ�>]�D]�Y�Zuigu���į$�X4�Ū}�)�fZ���u_߳Q�z�h0�M~e/��|g�{�Ė��&���6���V���ڌ�B\��[�彭�ic�h0�wF_>J�&�I�Cγ����h�r6� m�	]wߋE�LD�+Q&���Ih�=��f�L'����`o��7��)���	���},]}�^��9Dݶ�J<Z}T��=��Z�M��r������������c�������־}�]~����mp��H����Dy��;�}oP�(�����%Q;m�+g�w����'��x�'�2߫��=���0�$��������s6վ�L:�&~%G4�LC���C�\34�8B�})�(r�&�[4�ܡI��k�>�M���w���xҨ�<zO<�Z|n?4���ޡ�����v�Y�y���$4�ˡIơگh���$?Q�3�I�2���թ���j0~�#���G����Lh��D�lfҹg'�	�fT��2i{�7�Liz���mkc�ȯ�}��!Z��׳�f�}'4��M��н�mT��|��U&d��U��X5i_�C�\34�T��J���H�&��}ͫN�7��N�%!n���p�"t�Ũ.�F-�K�>?4��C�SM�A��|O��9%_�.e񫉢��� 6M��dED��!B�B���N<d}nVx�ڟ���my�%(��/��S���[��X��=4�7���ΎD��G�=��M�(5i;���/6CM��`�r�I�8/��Y�V��E�l5�bC���w�����`�-KM�T��п��ILSM�`M��Q��KfD�Kf�ڠj߾�M|;���Ju���V���FP4�#J%�����X�+�7���:�l�+�ڟ�P���U�=��Mly��j�$��ӷ�I��&뱥7�8e��v�k�v�K���݃	MN�����y�k.~�G48��z��$E�{�μ	��1i�7I=ۮ��϶cUhpw��W}�.�=��[�M�{M΂�>���ֿ�q�}}��#D[���ċ&%84��$�Mjghr�E48��ڟx��_�C�C��N��&�RU�V54���\�j]E��=Ff��Ig��O`�'0E�"��Y~����jcaz���0k�bE��3�ʔ��If���șt�}��A�δ*�D��š��☴�zE�{�����^�j�ǆ�2T��*4�On���\��Q]>�칰���N٨s��Q�94�kX�s���ɸ��=�F9ĸ�HVB��#s314�!27�f�[U�ܬy������8��{�(���8k�2w$g��� �d�1��N�|�_���k8i�2w$'�k�f�j37U�YFh2���5TM�N��oـ���h�h6/"�1ֿI,�]���@�RC��Աd��`�F��$ʳAL�7IiIT�164C��mh4��Ɠ�d<�|h2B��*(�� �5Mn,�7T�������G���j�wjf�^5hU5�n�����������T������T���~�����y�7�B�6:�+��U4h��l^��}��yѠ}��{hԾ{H}Zx�G���[4!D�v"�}v�Mxy��:U�,w��P�4��v�B�݉��L�Z�[�١�6B�/l���M��~��6_������jt
!49� ��+��B�;�%Ѩ�d�Ģ��`�K,�3%�j'�ݖ/�h����떩��Q]>��ehR�C��Mj'4���9OV��F��C��64��G��[5�ˡQ���=j�̈́&'E���IF��$��SF>C�~eh�+C�����deah�C�u��dB4X�M�!�:N�y�h2"��Ih�NB�vr���]5�iC�2	M�$t�LȗAB���hp�hht��jk�X_���n�j0B\�P;�s��-�Ih��44Y��i��?��?>??���     